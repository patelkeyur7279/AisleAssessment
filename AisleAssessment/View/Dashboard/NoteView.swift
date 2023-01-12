//
//  NoteView.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 12/01/23.
//

import SwiftUI

struct NoteView: View {
    
    @StateObject var viewModel = NoteViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("Notes")
                    .font(.gilory(.black, size: 27))
                    .foregroundColor(.black)
                
                Text("Personal messages to you")
                    .font(.gilory(.regular, size: 18))
                    .foregroundColor(.black)
                    .padding(.top)
                
                ForEach(0..<(viewModel.noteData.invites?.profiles ?? []).count, id: \.self) { index in
                    if let item = viewModel.noteData.invites?.profiles?[index] {
                        NoteInviteChildView(data: item)
                            .padding(.top)
                    }
                }
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Interested In You")
                            .font(.gilory(.bold, size: 27))
                            .foregroundColor(.black)
                        
                        Text("Premium members can view all their likes at once")
                            .font(.gilory(.light, size: 15))
                            .foregroundColor(.lightGray)
                        
                    }
                    
                    Spacer(minLength: 16)
                    
                    Button {
                        
                    } label: {
                        Text("Upgrade")
                            .font(.inter(.regular, size: 14))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.lightYellow)
                            .cornerRadius(20)
                    }

                    
                }
                .padding()
                
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(0..<(viewModel.noteData.likes?.profiles ?? []).count, id: \.self) { index in
                        if let item = viewModel.noteData.likes?.profiles?[index] {
                            NoteLikesChildView(data: item, canSeeProfiles: viewModel.noteData.likes?.canSeeProfile ?? false)
                        }
                    }
                }
                
            }
            
        }
        
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
