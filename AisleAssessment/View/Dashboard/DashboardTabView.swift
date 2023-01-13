//
//  DashboardTabView.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 12/01/23.
//

import SwiftUI

struct DashboardTabView: View {
    
    @State private var selection = 2
    
    init() {
        UITabBarItem.appearance().badgeColor = UIColor(named: "LightPurple")
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            Text("Discover Screen")
                .tabItem {
                    Image("Discover")
                    Text("Discover")
                        .font(.gilory(.regular, size: 12))
                        .foregroundColor(.lightGray)
                }
                .tag(1)
            
            NoteView()
                .tabItem {
                    Image("Notes")
                    
                    Text("Notes")
                        .font(.gilory(.regular, size: 12))
                        .foregroundColor(.lightGray)
                }
                .tag(2)
                .badge(
                    Text("9")
                )
            
            Text("Matches Screen")
                .tabItem {
                    Image("Matches")
                    Text("Matches")
                        .font(.gilory(.regular, size: 12))
                        .foregroundColor(.lightGray)
                }
                .tag(3)
                .badge(
                    Text("50+")
                )
            
            Text("Profile Screen")
                .tabItem {
                    Image("Profile")
                    Text("Profile")
                        .font(.gilory(.regular, size: 12))
                        .foregroundColor(.lightGray)
                }
                .tag(4)
            
        }
        
    }
}

struct DashboardTabView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
    }
}
