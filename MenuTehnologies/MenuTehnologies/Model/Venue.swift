//
//  Venue.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 5.10.22..
//

import Foundation

struct VenueModel: Identifiable, Codable{
    var id: UUID = UUID()
    var name: String
    var distance: String
    var address: String
    var status: String
}

// MARK: - MenuTehResponse
struct MenuTehResponse: Codable {
    let status: String
    let code: Int
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let venues: [VenueElement]
}

// MARK: - VenueElement
struct VenueElement: Codable {
    let distance, distanceInMiles: Double
    let venue: VenueVenue

    enum CodingKeys: String, CodingKey {
        case distance
        case distanceInMiles = "distance_in_miles"
        case venue
    }
}

// MARK: - VenueVenue
struct VenueVenue: Codable {
    let id: Int
    let name: String
    let venueDescription, welcomeMessage: String
    let address: String
    let state: Int
    let city, zip: String
    let latitude, longitude: Double
    let servingTimes: [WorkingTime]

    enum CodingKeys: String, CodingKey {
        case id, name
        case venueDescription = "description"
        case welcomeMessage = "welcome_message"
        case address, state, city, zip, latitude, longitude
        case servingTimes = "serving_times"
    }
}

//MARK: - WorkingTime
struct WorkingTime: Codable{
    let timeFrom, timeTo: String
    let days: [Int]

    enum CodingKeys: String, CodingKey {
            case timeFrom = "time_from"
            case timeTo = "time_to"
            case days
        }
}
