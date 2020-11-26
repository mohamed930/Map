//
//  bus.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation

class bus: Decodable {
    var route: route
    
    enum CodingKeys: String,CodingKey {
        case route
    }
}
