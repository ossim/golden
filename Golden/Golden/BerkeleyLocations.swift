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
    
    static let BigC = Location(title: "Big C", image: "BigC", latitude: 37.874591, longitude: -122.249626, describe: "The big C is a great place to take arial pictures of the campus! Be sure to come at night too when you can see all of the city lights.")
    
    static let FoundersRock = Location(title: "Founders Rock", image: "FoundersRock", latitude: 37.875336, longitude: -122.256889, describe: "According to Berkeley College Lore, this rock was the location where the 12 trustees of the College of California stood to dedicate the property they had just purchased. Take some cute pictures on this historic landmark with this cute mossy rock!")
    
    static let Campanile = Location(title: "The Campanile", image: "Campanile", latitude: 37.872067, longitude: -122.257812, describe: "Come take some amazing arial pictures at the largest clock tower of all the UC's! Taking pictures up here during golden hours can produce some amazing stuff so be sure to time your visit well!")
    
    static let CampanileWay = Location(title: "Campanile Way", image: "CampanileWay", latitude: 37.871906, longitude: -122.258542, describe: "Make the steep trek up this street to take some cool pictures! From the top of this hill, you can see a clear view of the bay and the Golden Gate Bridge, as well as get a nice view of all the buildings and trees.")
    
    static let SatherGate = Location(title: "Sather Gate", image: "SatherGate", latitude: 37.870255, longitude: -122.259496, describe: "Sather Gate is the prime landmark on Berkeley where you can take some cool symmetrical pictures! If you're lucky, you may even run into an a cappella group performing there in the afternoon!")
    
    static let VLSB = Location(title: "Outside VLSB", image: "VLSB", latitude: 37.871531, longitude: -122.261084, describe: "There are some trees outside VLSB that bloom in the spring. These trees are big enough for even a person to lay down on, so come at the right time to take aesthetic pictures!")
    
    static func getLocationArray() -> [Location] {
        let locationArray: [Location] = [Moffitt, Mainstacks, DOE, BigC, FoundersRock, Campanile, CampanileWay, SatherGate, VLSB]
        return locationArray
    }
    
}
