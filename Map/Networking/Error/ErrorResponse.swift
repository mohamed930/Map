//
//  ErrorResponse.swift
//  Map
//
//  Created by Mohamed Ali on 11/27/20.
//

import Foundation

class ErrorResponse: Decodable {
    var status: Bool
    var message: String
    
    enum CodingKeys: String,CodingKey {
        case status = "Status"
        case message = "Message"
    }
}
