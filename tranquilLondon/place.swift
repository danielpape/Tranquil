//
//  place.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 13/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let placeCat: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, placeCat: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.placeCat = placeCat
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    class func fromJSON(json: [JSONValue]) -> Place? {
        // 1
        var title: String
        if let titleOrNil = json[0].string {
            title = titleOrNil
        } else {
            title = ""
        }
        let locationName = json[1].string
        let placeCat = json[2].string
        
        // 2
        let latitude = (json[3].string! as NSString).doubleValue
        let longitude = (json[4].string! as NSString).doubleValue
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        // 3
        return Place(title: title, locationName: locationName!, placeCat: placeCat!, coordinate: coordinate)
    }
}