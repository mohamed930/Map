//
//  AboutUsResponse.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation

class AboutUsResponse: Decodable {
    var status: Bool
    var InnerData: [AboutInnerData]
    
    enum CodingKeys: String,CodingKey {
        case status = "Status"
        case InnerData
    }
}

class AboutInnerData: Decodable {
    var HTMLBody: String
    
    enum CodingKeys: String,CodingKey {
        case HTMLBody = "content"
    }
}
