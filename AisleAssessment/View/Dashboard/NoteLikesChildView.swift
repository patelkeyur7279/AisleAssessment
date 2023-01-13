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
                            .overlay {
                                VStack {
                                    Spacer()
                                    LinearGradient(gradient: Gradient(colors: [.clear, .transparentGray]),
                                                   startPoint: .top,
                                                   endPoint: .bottom)
                                        .frame(height: 60)
                                }
                            }
                    } placeholder: {
                        Image(systemName: "photo.fill")
                    }
                    .cornerRadius(10)
                    .clipped()
                    .padding(0)
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Spacer()
                    
                    Text(data.firstName ?? "-")
                        .font(.refinery95(.bold, size: 16))
                        .foregroundColor(.white)
                    
                }
                .padding(16)
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
