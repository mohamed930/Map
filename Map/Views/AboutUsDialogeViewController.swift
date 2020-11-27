//
//  AboutUsDialogeViewController.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import UIKit
import WebKit

protocol PopupProtocol {
    func Back()
}

class AboutUsDialogeViewController: UIViewController {
    
    var aboutusview: AboutUsDialogueView! {
        guard isViewLoaded else { return nil }
        return (view as! AboutUsDialogueView)
    }
    
    var delegate: PopupProtocol!
    var UserTocken = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        aboutusview.myWebKit.scrollView.showsHorizontalScrollIndicator = false
        aboutusview.myWebKit.scrollView.showsVerticalScrollIndicator = false
        
        LoadPage()
    }
    
    @IBAction func BTNOk (_ sender: Any) {
        self.delegate.Back()
    }
    
    func LoadPage() {
        
        let ob = AboutUsAPI()
        
        ob.GetAboutUs(Tocken: UserTocken) { (response) in
            
            switch response {
            
            case .success(let res):
                
                if res?.status == true {
                    self.aboutusview.myWebKit.loadHTMLString((res?.InnerData.first?.HTMLBody)!, baseURL: nil)
                }
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
            }
            
        }
    }

}
