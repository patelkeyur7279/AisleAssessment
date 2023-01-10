//
//  ServiceManager.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import Foundation
import Alamofire

class ServiceManager {
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 60
        configuration.waitsForConnectivity = true
        return Session(configuration: configuration)
    }()
    
}
