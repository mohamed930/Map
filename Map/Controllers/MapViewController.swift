//
//  ViewController.swift
//  Map
//
//  Created by Mohamed Ali on 11/26/20.
//

import UIKit
import Alamofire
import AlamofireImage
import MapKit

class MapViewController: UIViewController {
    
    var latituideArr = [Double]()
    var longtuideArr = [Double]()
    
    var mapview: MapView! {
        guard isViewLoaded else { return nil }
        return (view as! MapView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tab = UITapGestureRecognizer()
        tab = UITapGestureRecognizer(target: self, action: #selector(ShowDialogue(tapGestureRecognizer:)))
        tab.numberOfTapsRequired = 1
        tab.numberOfTouchesRequired = 1
        self.mapview.ProfileImage.isUserInteractionEnabled = true
        self.mapview.ProfileImage.addGestureRecognizer(tab)
        
        LoadData()
    }
    
    // MARK:- TODO:- This Method For Image Tap Action
    @objc func ShowDialogue (tapGestureRecognizer: UITapGestureRecognizer) {
        print("Hello New Task is Tomorrow!")
    }
    
    func LoadData () {
        
        let ob = checkCredentialsAPI()
        
        ob.login(name: "bola_d", password: "1234", deviceToken: "") { (response) in
            
            switch response {
            
            case .success(let ob):
                
                if ob?.status == true {
                    
                    self.getPhoto(URL: (ob?.InnerData.user.PhotoLink)!, Image: self.mapview.ProfileImage)
                    
                    for i in 0...((ob?.InnerData.user.bus.route.routePath.count)! - 1) {
                        self.latituideArr.append((ob?.InnerData.user.bus.route.routePath[i].latitude)!)
                        self.longtuideArr.append((ob?.InnerData.user.bus.route.routePath[i].longtitude)!)
                    }
                    
                    self.DrawLine(longArr: self.longtuideArr, latitArr: self.latituideArr)
                    
                    for i in 0...((ob?.InnerData.user.bus.route.stopPoints.count)! - 1) {
                        
                        self.MakeLocation(Title: "Stop Points", SubTitle: "Bus Stop here", lati: (ob?.InnerData.user.bus.route.stopPoints[i].latitude)!, long: (ob?.InnerData.user.bus.route.stopPoints[i].longtitude)!)
                    }
                }
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
            }
            
        }
        
    }
    
    // MARK:- TODO:- This Method For Download Image From API.
    func getPhoto (URL:String,Image:UIImageView) {
        AF.request(URL).responseImage(completionHandler: {
            (response) in
            
            switch response.result {
                case .success(let image1):
                    let size = CGSize(width: 1000.0, height: 1000.0)
                    let scaleImage = image1.af.imageScaled(to: size)
                    DispatchQueue.main.async {
                        Image.image = scaleImage
                    }
                case .failure(_):
                    print("Error Connection")
            }
            
        })
    }
    
    // MARK:- TODO:- This Method For Making a Pin in Map.
    func MakeLocation (Title:String,SubTitle:String,lati:Double,long:Double)  {
        
        let anotation = MKPointAnnotation()
        
        anotation.coordinate = CLLocationCoordinate2D(latitude: lati, longitude: long)
        mapview.mapView.addAnnotation(anotation)
        anotation.title = Title
        anotation.subtitle = SubTitle
        let range = MKCoordinateRegion(center: anotation.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        mapview.mapView.setRegion(range, animated: true)
        
    }
    
    
    var longIndex = 0
    
    // MARK:- TODO:- This Method For Draw Line.
    func DrawLine (longArr: [Double] , latitArr: [Double]) {
        while longIndex < (longArr.count - 1) {
            
            let sourcePlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: latituideArr[longIndex], longitude: longArr[longIndex]))
            
            let destinationPlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: latituideArr[(longIndex + 1)], longitude: longArr[(longIndex + 1)]))
            
            let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
            directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
            directionRequest.transportType = .automobile
            
            let direction = MKDirections(request: directionRequest)
            direction.calculate { (direction, error) in
                guard let directionResponse = direction else{
                    if error != nil {
                        print("Error in drawing! \((error?.localizedDescription)!)")
                    }
                    return
                }
                
                let route = directionResponse.routes[0]
                self.mapview.mapView.addOverlay(route.polyline,level: .aboveRoads)
            
                let rect = route.polyline.boundingMapRect
                self.mapview.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
             }
            
            self.mapview.mapView.delegate = self
            
            longIndex += 1
        }
        
        
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    // MARK:- mapkit delegates
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
}

