//
//  AisleAssessmentApp.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import SwiftUI

@main
struct AisleAssessmentApp: App {
    
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
                ContentView()
//                if UserDefaults.standard.getToken() != nil && !(UserDefaults.standard.getToken()?.isEmpty ?? false) {
//                    DashboardTabView()
//                } else {
//                    ContentView()
//                }
            }
        }
    }
}
