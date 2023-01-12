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
            
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text("\(data.generalInformation?.fName ?? "-"), \(data.generalInformation?.age ?? 0)")
                    .colorInvert()
                
                Text("Tap to review 50+ notes")
                    .colorInvert()
                
            }
            .padding()
            
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
