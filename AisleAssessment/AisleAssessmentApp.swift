//
//  AisleAssessmentApp.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import SwiftUI

@main
struct AisleAssessmentApp: App {
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
