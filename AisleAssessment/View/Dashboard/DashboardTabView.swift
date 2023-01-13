//
//  DashboardTabView.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 12/01/23.
//

import SwiftUI

struct DashboardTabView: View {
    
    init() {
        UITabBarItem.appearance().badgeColor = UIColor(named: "LightPurple")
    }
    
    var body: some View {
        
        TabView {
            
            Text("Discover Screen")
                .tabItem {
                    Image("Discover")
                    Text("Discover")
                        .font(.gilory(.regular, size: 12))
                        .foregroundColor(.lightGray)
                }
            
            NoteView()
                .tabItem {
                    Image("Notes")
                    
                    Text("Notes")
                        .font(.gilory(.regular, size: 12))
                        .foregroundColor(.lightGray)
                }
                .badge(
                    Text("9")
//                        .foregroundColor(.lightPurple)
//                        .font(.headline)
                )
            
            Text("Matches Screen")
                .tabItem {
                    Image("Matches")
                    Text("Matches")
                        .font(.gilory(.regular, size: 12))
                        .foregroundColor(.lightGray)
                }
                .badge(
                    Text("50+")
//                        .foregroundColor(.lightPurple)
//                        .font(.headline)
                )
            
            Text("Profile Screen")
                .tabItem {
                    Image("Profile")
                    Text("Profile")
                        .font(.gilory(.regular, size: 12))
                        .foregroundColor(.lightGray)
                }
            
        }
        
    }
}

struct DashboardTabView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
    }
}
