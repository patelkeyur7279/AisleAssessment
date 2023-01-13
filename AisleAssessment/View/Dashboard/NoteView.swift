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
                    .font(.refinery95(.bold, size: 27))
                    .foregroundColor(.black)
                
                Text("Personal messages to you")
                    .font(.gilory(.medium, size: 18))
                    .foregroundColor(.black)
                    .padding(.top, 2)
                
                ForEach(0..<(viewModel.noteData.invites?.profiles ?? []).count, id: \.self) { index in
                    if let item = viewModel.noteData.invites?.profiles?[index] {
                        NoteInviteChildView(data: item)
                            .padding(.top)
                    }
                }
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Interested In You")
                            .font(.refinery95(.bold, size: 22))
                            .foregroundColor(.black)
                            .padding(.bottom, 2)
                        
                        Text("Premium members can view all their likes at once")
                            .font(.gilory(.medium, size: 15))
                            .foregroundColor(.lightGray)
                            .lineSpacing(6)
                        
                    }
                    
                    Spacer(minLength: 16)
                    
                    Button {
                        
                    } label: {
                        Text("Upgrade")
                            .font(.refinery95(.bold, size: 14))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.lightYellow)
                            .cornerRadius(20)
                    }

                    
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(0..<(viewModel.noteData.likes?.profiles ?? []).count, id: \.self) { index in
                        if let item = viewModel.noteData.likes?.profiles?[index] {
                            NoteLikesChildView(data: item, canSeeProfiles: viewModel.noteData.likes?.canSeeProfile ?? false)
                        }
                    }
                }
                .padding(.bottom)
                .padding(.horizontal)
                
            }
            
        }
        
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
