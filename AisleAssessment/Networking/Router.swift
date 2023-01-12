//
//  Router.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import Foundation
import Alamofire

enum Router {
    case PhoneNumberLogin(number: String)
    case VerifyOTP(number: String, otp: String)
    case Notes(token: String)
    
    var path: String {
        switch self {
        case .PhoneNumberLogin:
            return "/users/phone_number_login"
        case .VerifyOTP:
            return "/users/verify_otp"
        case .Notes:
            return "/users/test_profile_list"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .PhoneNumberLogin:
            return .post
        case .VerifyOTP:
            return .post
        case .Notes:
            return .get
        }
    }
    
    var parameters: [String: String]? {
        switch self {
        case .PhoneNumberLogin(let number):
            return [
                "number": number
            ]
        case .VerifyOTP(let number, let otp):
            return ["number": number,
                    "otp": otp]
        case .Notes(let token):
            return ["Authorization": token]
        }
    }
    
}

extension Router: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = try BASE_URL.asURL().appendingPathComponent(path)
        print("URL: \(url)")
        var request = URLRequest(url: url)
        request.method = method
        print("Parameters: \(parameters)")
        request = try URLEncoding.default.encode(request, with: parameters)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        switch self {
        case .PhoneNumberLogin(_):
            break
        case .VerifyOTP(_,  _):
            break
        case .Notes(let token):
            request.setValue(token, forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
}
