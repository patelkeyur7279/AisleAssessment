//
//  AisleAssessmentApp.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import SwiftUI

@main
struct AisleAssessmentApp: App {
    
    @StateObject var viewModel = AuthViewModel.shared
    
    init() {
        for family in UIFont.familyNames {
            print(family)
            for names in UIFont.fontNames(forFamilyName: family){
                print("== \(names)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if viewModel.otpVerifySccess || UserDefaults.standard.getToken() != nil && !(UserDefaults.standard.getToken()?.isEmpty ?? false) {
                    DashboardTabView()
                } else {
                    ContentView()
                }
            }
        }
    }
}
