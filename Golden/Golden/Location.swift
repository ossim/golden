//
//  Location.swift
//  Golden
//
//  Created by Evan Chang on 4/17/17.
//  Copyright © 2017 David Xie and Evan Chang. All rights reserved.
//

import Foundation
import MapKit

class Location : NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    let image: String
    let describe: String
    
    init(title: String, image: String, latitude: Float, longitude: Float, describe: String) {
        self.title = title
        self.image = image
        self.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(latitude), CLLocationDegrees(longitude))
        self.describe = describe
    }
    
}
