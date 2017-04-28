//
//  BerkeleyLocations.swift
//  Golden
//
//  Created by Evan Chang on 4/17/17.
//  Copyright © 2017 David Xie and Evan Chang. All rights reserved.
//

import Foundation

class BerkeleyLocations {
    
    static let Moffitt = Location(title: "Moffitt", image: "Moffitt", latitude: 37.8726, longitude: -122.2607, describe: "The tinted windows on the fourth floor can be used to take some cool and colorful pictures! Be sure to time it well so the sunlight comes in perfectly.")
    
    static let Mainstacks = Location(title: "Mainstacks", image: "Mainstacks", latitude: 37.8721, longitude: -122.2596, describe: "The spiral staircase is a great place to take some artistic pictures from different lower or upper angles. You can also use the symmetery of the room to take some cool abstract pictures!")
    
    static let DOE = Location(title: "DOE", image: "DOE", latitude: 37.8722, longitude: -122.2596, describe: "DOE Library literally screams Harry Potter aesthetic. So let your inner nerd come out and take some great pictures while you study!")
    
    static func getLocationArray() -> [Location] {
        let locationArray: [Location] = [Moffitt, Mainstacks, DOE]
        return locationArray
    }
    
}
