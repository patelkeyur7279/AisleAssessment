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
    
    @Published var countryCode: String = ""
    @Published var phoneNumber: String = ""
    @Published var otp: String = ""
    
    @Published var otpExpireTime: String = ""
    
    @Published var loginSuccess: Bool = false
    @Published var token: String = ""
    @Published var error: Bool = false
    
    // MARK: Other Functions
    var getPhoneNumber: String {
        return countryCode + phoneNumber
    }
    
    // MARK: API Calls
    func phoneNumberLogin() {
        
        guard !getPhoneNumber.isEmpty else { return }
        
        ServiceManager.shared.sessionManager.request(Router.PhoneNumberLogin(number: getPhoneNumber))
            .publishDecodable(type: PhoneNumbderLoginResponse.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (result) in
                print("Response: \(result)")
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
        
        print("verifyOtp: \(getPhoneNumber), \(otp)")
        
        guard !getPhoneNumber.isEmpty && !otp.isEmpty else { return }
        
        ServiceManager.shared.sessionManager.request(Router.VerifyOTP(number: getPhoneNumber, otp: otp))
            .publishDecodable(type: VerifyOTPResponse.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (result) in
                print("Response: \(result)")
                if let value = result.value {
                    self?.token = value.token ?? ""
                    self?.getNotes()
                } else if let error = result.error {
                    print("Error: \(String(describing: error.errorDescription))")
                    self?.error = true
                }
            }
            .store(in: &cancellables)
        
    }
    
    
    
}
