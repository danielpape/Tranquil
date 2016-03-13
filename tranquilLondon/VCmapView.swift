//
//  VCmapView.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 13/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import Foundation

import MapKit

extension ViewController: MKMapViewDelegate {
    
    // 1
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Place {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type:.InfoDark) as UIView
                configureDetailView(view)
            return view
            }
        }
        return nil
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl) {
            performSegueWithIdentifier("showPlaceView", sender: nil)
    }
    
    func configureDetailView(annotationView: MKAnnotationView) {
        let width = 150
        let height = 150
        
        let snapshotView = UIView()
        let views = ["snapshotView": snapshotView]
        snapshotView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[snapshotView(180)]", options: [], metrics: nil, views: views))
        snapshotView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[snapshotView(180)]", options: [], metrics: nil, views: views))
        
        let options = MKMapSnapshotOptions()
        options.size = CGSize(width: width, height: height)
        options.mapType = .SatelliteFlyover
        options.camera = MKMapCamera(lookingAtCenterCoordinate: annotationView.annotation!.coordinate, fromDistance: 150, pitch: 55, heading: 0)
        
        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.startWithCompletionHandler { snapshot, error in
            if snapshot != nil {
                let imageView = UIImageView(frame: CGRect(x: 15, y: 15, width: width, height: height))
                imageView.image = snapshot!.image
                self.makeImageRound(imageView)
                snapshotView.addSubview(imageView)
            }
        }
        
        annotationView.detailCalloutAccessoryView = snapshotView
    }
    
    func makeImageRound(image:UIImageView){
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.whiteColor().CGColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
}