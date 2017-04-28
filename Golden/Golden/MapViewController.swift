//
//  MapViewController.swift
//  Golden
//
//  Created by Evan Chang on 4/1/17.
//  Copyright © 2017 David Xie and Evan Chang. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    //mapView didSelectAnnotationView view = annotation object;
    //have a view in the bottom that is hidden- animated attribute? Look up how to animate swift hidden view
    @IBOutlet var masterView: UIView!
    
    @IBOutlet var mapViewOutlet: MKMapView!
    
    override func viewDidLoad() {
        mapViewOutlet.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let initialLoc = CLLocation(latitude:37.871853, longitude:-122.258423)
        centerMapOnLocation(location: initialLoc)
        descriptionTab.isHidden = true
        let locationArray = BerkeleyLocations.getLocationArray()
        for i in locationArray {
            self.mapViewOutlet.addAnnotation(i)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        locationName.text = (view.annotation?.title)!
        locationImage.image = (UIImage(named: (view.annotation as! Location).image))
        locationDescription.text = (view.annotation as! Location).describe
        UIView.animate(withDuration: 1.0, animations: {
            self.descriptionTab.frame.origin.y = self.descriptionTab.frame.size.height
            self.descriptionTab.isHidden = false
        })
    }
    
    func mapView(_: MKMapView, didDeselect: MKAnnotationView) {
        UIView.animate(withDuration: 1.0, animations: {
            self.descriptionTab.frame.origin.y = self.masterView.frame.origin.y + self.masterView.frame.size.height
            self.descriptionTab.isHidden = true
        })
    }
    
    @IBOutlet var descriptionTab: UIView!
    
    @IBOutlet var locationName: UILabel!
    
    @IBOutlet var locationDescription: UILabel!
    
    @IBOutlet var locationImage: UIImageView!
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0,regionRadius * 2.0)
        mapViewOutlet.setRegion(coordinateRegion,
                          animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
