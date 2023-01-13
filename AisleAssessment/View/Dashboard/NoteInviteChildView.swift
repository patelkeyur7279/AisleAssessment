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
                            .overlay {
                                VStack {
                                    Spacer()
                                    LinearGradient(gradient: Gradient(colors: [.clear, .transparentGray]),
                                                   startPoint: .top,
                                                   endPoint: .bottom)
                                        .frame(height: 100)
                                }
                            }
                    } placeholder: {
                        Image(systemName: "photo.fill")
                    }
                    .cornerRadius(10)
                    .clipped()
                    .padding(.vertical, 4)
                    .padding(.horizontal)
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text("\(data.generalInformation?.fName ?? "-"), \(data.generalInformation?.age ?? 0)")
                        .font(.gilory(.bold, size: 22))
                        .foregroundColor(.white)
                        .padding(.bottom, 2)
                    
                    Text("Tap to review 50+ notes")
                        .font(.gilory(.semiBold, size: 15))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
                Spacer()
            }
            
            
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
