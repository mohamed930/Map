//
//  user.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation

class user: Decodable {
    var PhotoLink: String
    var bus: bus
    
    enum CodingKeys: String,CodingKey {
        case PhotoLink
        case bus
    }
}
