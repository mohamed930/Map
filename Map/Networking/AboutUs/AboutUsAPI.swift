//
//  AboutUsAPI.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import Foundation

protocol AboutUsAPIProtocol {
    func GetAboutUs(Tocken:String,completion: @escaping (Result<AboutUsResponse?,NSError>) -> Void)
}

class AboutUsAPI: BaseAPI<AboutUsNetworking>, AboutUsAPIProtocol {
    
    func GetAboutUs(Tocken: String, completion: @escaping (Result<AboutUsResponse?, NSError>) -> Void) {
        self.fetchData(Target: .AboutUs(Tocken: Tocken), ClassName: AboutUsResponse.self) { (response) in
            completion(response)
        }
    }
    
}
