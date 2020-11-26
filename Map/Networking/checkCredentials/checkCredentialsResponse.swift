//
//  checkCredentialsResponse.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation

class checkCredentialsResponse: Decodable {
    var status: Bool
    var InnerData: InnerData
    
    enum CodingKeys: String,CodingKey {
        case status = "Status"
        case InnerData
    }
}

class InnerData : Decodable {
    var tocken: String
    //var user: user
    
    enum CodingKeys: String,CodingKey {
        case tocken = "token"
    }
}
