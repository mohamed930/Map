//
//  ViewController.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import UIKit

class MapViewController: UIViewController {
    
    var mapview: MapView! {
        guard isViewLoaded else { return nil }
        return (view as! MapView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoadData()
    }
    
    func LoadData () {
        
        let ob = checkCredentialsAPI()
        
        ob.login(name: "bola_d", password: "1234", deviceToken: "") { (response) in
            
            switch response {
            
            case .success(let ob):
                
                if ob?.status == true {
                    print("Success here is Token: \((ob?.InnerData.tocken)!)")
                }
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
            }
            
        }
        
    }


}

