//
//  Dimension.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation

class Dimension: Decodable {
    var latitude: Double
    var longtitude: Double
    
    enum CodingKeys: String,CodingKey {
        case latitude = "lat"
        case longtitude = "lng"
    }
}
