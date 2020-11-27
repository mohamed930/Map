//
//  AboutUsNetworking.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation
import Alamofire

enum AboutUsNetworking {
    case AboutUs(Tocken:String)
}

extension AboutUsNetworking: TargetType {
    
    var baseURL: String {
        return baseUrl
    }
    
    var path: String {
        return AboutUsPoint
    }
    
    var method: HTTPMethod {
        switch self {
        
        case .AboutUs:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        
        case .AboutUs:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
       
        case .AboutUs(let Tocken):
            return ["Authorization":"Bearer {\(Tocken)}"]
        }
    }
}
