//
//  Extensions.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 12/01/23.
//

import Foundation

// MARK: UserDefaults
extension UserDefaults {
    
    // MARK: - Global Static Variables
    private static let TOKEN = "Token"
    
    func saveToken(token: String) {
        UserDefaults.standard.setValue(token, forKey: UserDefaults.TOKEN)
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaults.TOKEN)
    }
    
}
