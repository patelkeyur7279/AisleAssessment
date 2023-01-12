//
//  AuthAPIResponses.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import Foundation

struct PhoneNumbderLoginResponse: Codable {
    var status: Bool?
}

struct VerifyOTPResponse: Codable {
    var token: String?
}
