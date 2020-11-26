//
//  route.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation

class route: Decodable {
    var routePath: [Dimension]
    var stopPoints: [Dimension]
    //var name: String
    
    enum CodingKeys: String,CodingKey {
        case routePath
        case stopPoints = "stop_points"
        //case name
    }
}
