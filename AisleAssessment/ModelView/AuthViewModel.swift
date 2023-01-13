//
//  ViewModel.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    
    // MARK: Global Variables
    private var cancellables = Set<AnyCancellable>()
    
    static let shared = AuthViewModel()
    
    @Published var countryCode: String = "+91"
    @Published var phoneNumber: String = "9876543212"
    @Published var otp: String = "1234"
    
    @Published var otpExpireTime: String = ""
    
    @Published var loginSuccess: Bool = false
    @Published var otpVerifySccess: Bool = false
    @Published var error: Bool = false
    
    @Published var isAPICalling: Bool = false
    
    // MARK: Other Functions
    var getPhoneNumber: String {
        return countryCode + phoneNumber
    }
    
    // MARK: API Calls
    func phoneNumberLogin() {
        
        guard !getPhoneNumber.isEmpty && getPhoneNumber.count > 10 else { return }
        
        isAPICalling = true
        
        ServiceManager.shared.sessionManager.request(Router.PhoneNumberLogin(number: getPhoneNumber))
            .publishDecodable(type: PhoneNumbderLoginResponse.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (result) in
                self?.isAPICalling = false
                if let value = result.value {
                    self?.loginSuccess = value.status ?? false
                } else if let error = result.error {
                    print("Error: \(String(describing: error.errorDescription))")
                    self?.error = true
                }
            }
            .store(in: &cancellables)
        
    }
    
    func verifyOtp() {
        
        guard !getPhoneNumber.isEmpty && !otp.isEmpty else { return }
        
        isAPICalling = true
        
        ServiceManager.shared.sessionManager.request(Router.VerifyOTP(number: getPhoneNumber, otp: otp))
            .publishDecodable(type: VerifyOTPResponse.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (result) in
                self?.isAPICalling = false
                if let value = result.value {
                    UserDefaults.standard.saveToken(token: value.token ?? "")
                    self?.otpVerifySccess = true
                } else if let error = result.error {
                    print("Error: \(String(describing: error.errorDescription))")
                    self?.error = true
                }
            }
            .store(in: &cancellables)
        
    }
    
    
    
}
