//
//  NoteInviteChildView.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 12/01/23.
//

import SwiftUI

struct NoteInviteChildView: View {
    
    var data: NoteInvitesProfile
    
    var body: some View {
        
        ZStack {
            
            AsyncImage(url: URL(string: data.photos?.first?.photo ?? "")!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .layoutPriority(-1)
                    } placeholder: {
                        Image(systemName: "photo.fill")
                    }
                    .cornerRadius(10)
                    .clipped()
                    .padding()
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text("\(data.generalInformation?.fName ?? "-"), \(data.generalInformation?.age ?? 0)")
                        .font(.gilory(.bold, size: 22))
                        .foregroundColor(.white)
                    
                    Text("Tap to review 50+ notes")
                        .font(.gilory(.bold, size: 15))
                        .foregroundColor(.white)
                        .padding(.top, 6)
                }
                .padding(22)
                
                Spacer()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.clear, .transparentGray]),
                               startPoint: .top,
                               endPoint: .bottom)
            )
            
        }
        .onAppear {
            print("Data: \(data)")
        }
        
    }
}

struct NoteInviteChildView_Previews: PreviewProvider {
    static var previews: some View {
        NoteInviteChildView(data: NoteInvitesProfile())
    }
}
