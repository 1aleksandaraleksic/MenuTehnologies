//
//  Location.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 5.10.22..
//

import Foundation

struct LocationModel: Codable{
    let latitude: Double
    let longitude: Double

    init(latitude: Double, longitude: Double){
        self.latitude = latitude
        self.longitude = longitude
    }
}
