//
//  checkCredentialsNetworking.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation
import Alamofire

enum checkCredentialsNetworking {
    case Log_in_as_Supervisor(name:String,password:String,deviceToken:String)
}

extension checkCredentialsNetworking: TargetType {
    
    var baseURL: String {
        return baseUrl
    }
    
    var path: String {
        switch self {
        case .Log_in_as_Supervisor:
            return checkCredentialsPoint
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .Log_in_as_Supervisor:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .Log_in_as_Supervisor(let name, let password, let deviceToken):
            
            let params = ["name": name , "password": password , "deviceToken": deviceToken]
            
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        
        case .Log_in_as_Supervisor:
            return [:]
        }
    }
    
}
