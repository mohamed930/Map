//
//  TargetType.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation
import Alamofire

var baseUrl = "http://inaclick.online/mtc/"
var checkCredentialsPoint = "account/checkCredentials"
var AboutUsPoint = "aboutus/aboutUs"

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    case requestPlain
    case requestParameters(parameters : [String:Any] , encoding: ParameterEncoding)
}

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String:String]? { get }
}
