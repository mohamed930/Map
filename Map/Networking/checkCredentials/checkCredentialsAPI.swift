//
//  checkCredentialsAPI.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation

protocol checkCredentialsProtocol {
    func login(name: String , password: String , deviceToken: String,completion: @escaping (Result<checkCredentialsResponse?,NSError>) -> Void)
}

class checkCredentialsAPI: BaseAPI<checkCredentialsNetworking> , checkCredentialsProtocol {
    
    func login(name: String , password: String , deviceToken: String,completion: @escaping (Result<checkCredentialsResponse?,NSError>) -> Void) {
        
        self.fetchData(Target: .Log_in_as_Supervisor(name: name, password: password, deviceToken: deviceToken), ClassName: checkCredentialsResponse.self) { (response) in
            completion(response)
        }
        
    }
    
}
