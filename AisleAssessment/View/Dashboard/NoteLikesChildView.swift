//
//  NoteLikesChildView.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 12/01/23.
//

import SwiftUI

struct NoteLikesChildView: View {
    
    var data: NoteLikesProfile
    var canSeeProfiles: Bool
    
    var body: some View {
        
        ZStack {
            
            AsyncImage(url: URL(string: data.avatar ?? "")!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .layoutPriority(-1)
                            .blur(radius: canSeeProfiles ? 0 : 20)
                    } placeholder: {
                        Image(systemName: "photo.fill")
                    }
                    .cornerRadius(10)
                    .clipped()
                    .padding()
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Spacer()
                    
                    Text(data.firstName ?? "-")
                        .font(.gilory(.bold, size: 18))
                        .foregroundColor(.white)
                    
                }
                .padding()
                Spacer()
            }
            
        }
        
    }
}

struct NoteLikesChildView_Previews: PreviewProvider {
    static var previews: some View {
        NoteLikesChildView(data: NoteLikesProfile(), canSeeProfiles: false)
    }
}
