//
//  NoteViewModel.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import Foundation
import Combine

class NoteViewModel: ObservableObject {
    
    // MARK: Global Variables
    private var cancellables = Set<AnyCancellable>()
    
    lazy var token: String = {
        return UserDefaults.standard.getToken() ?? ""
    }()
    
    @Published var noteData: NoteResponse = NoteResponse()
    
    
    init() {
        getNotes()
    }
    
    // MARK: API Calls
    func getNotes() {
        
        ServiceManager.shared.sessionManager.request(Router.Notes(token: token))
            .publishDecodable(type: NoteResponse.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (result) in
                print("Response: \(result)")
                if let value = result.value {
                    self?.noteData = value
                } else if let error = result.error {
                    print("Error: \(String(describing: error.errorDescription))")
                }
            }
            .store(in: &cancellables)
        
    }
    
}
