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
                Text("Personal messages to you")
                
                ForEach(0..<(viewModel.noteData.invites?.profiles ?? []).count, id: \.self) { index in
                    if let item = viewModel.noteData.invites?.profiles?[index] {
                        NoteInviteChildView(data: item)
                    }
                }
                
                HStack {
                    
                    VStack {
                        
                        Text("Interested In You")
                        
                        Text("Premium members can view all their likes at once")
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Upgrade")
                    }

                    
                }
                
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
