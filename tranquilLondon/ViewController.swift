//
//  ViewController.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 05/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mainMapView: MKMapView!
    
    var places = [Place]()

    override func viewDidLoad() {
        mainMapView.delegate = self
        
        let testPlace = Place(title: "Test Place",
            locationName: "Test Location",
            discipline: "Test Discipline",
            coordinate: CLLocationCoordinate2D(latitude: 51.505572, longitude: -0.184855))
        
        mainMapView.addAnnotation(testPlace)
        
        loadInitialData()
        mainMapView.addAnnotations(places)
        
        super.viewDidLoad()
        setMapCenter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setMapCenter(){
        let longitude:CLLocationDegrees = -0.184855
        let latitude:CLLocationDegrees = 51.505572
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let coordinates:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(coordinates, span)
        mainMapView.setRegion(region, animated: true)
        
//        let annotation:MKPointAnnotation = MKPointAnnotation()
//        annotation.coordinate = coordinates
//        annotation.title = "Test Annotation"
//        mainMapView.addAnnotation(annotation)
    }
    
    func loadInitialData() {
        // 1
        let fileName = NSBundle.mainBundle().pathForResource("PublicArt", ofType: "json");
        var data: NSData? = nil
        do {
            data = try NSData(contentsOfFile: fileName!, options: NSDataReadingOptions.DataReadingMappedIfSafe)

        }
        catch {
            print("Error")
        }
        var jsonObject: AnyObject? = nil
        do{
            jsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
        }
        catch {
            print("Error")
        }
        if let jsonObject = jsonObject as? [String: AnyObject],
            let jsonData = JSONValue.fromObject(jsonObject)?["data"]?.array {
                for artworkJSON in jsonData {
                    if let artworkJSON = artworkJSON.array,
                        Place = Place.fromJSON(artworkJSON) {
                            places.append(Place)
                            print(places)
                    }
                }
        }
    }
    
}