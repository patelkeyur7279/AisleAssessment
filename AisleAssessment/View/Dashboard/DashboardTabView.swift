//
//  DashboardTabView.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 12/01/23.
//

import SwiftUI

struct DashboardTabView: View {
    var body: some View {
        
        TabView {
            
            Text("Discover Screen")
                .tabItem {
                    Image("Discover")
                    Text("Discover")
                }
            
            NoteView()
                .tabItem {
                    Image("Notes")
                    Text("Notes")
                }
            
            Text("Matches Screen")
                .tabItem {
                    Image("Matches")
                    Text("Matches")
                }
            
            Text("Profile Screen")
                .tabItem {
                    Image("Profile")
                    Text("Profile")
                }
            
        }
        
    }
}

struct DashboardTabView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
    }
}
