//
//  VenueListViewModel.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 5.10.22..
//

import Foundation

class VenueListViewModel: ObservableObject{
    @Published var venues: [VenueModel] = []

    public func fetchVenes(){
        // MARK: TODO take a  location from user
        let currentLocation = LocationModel(latitude: 44.001783, longitude: 21.26907)
        if let jsonData = try? JSONEncoder().encode(currentLocation){
            guard let urlRequest: URLRequest = Constants.shared.listOfVenuesURL(jsonData: jsonData) else { return }

            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, error == nil else {
                    return
                }

                if let menuTehResponse = try? JSONDecoder().decode(MenuTehResponse.self, from: data){
                    var tempArray: [VenueModel] = []
                    for mtr in menuTehResponse.data.venues{
                        tempArray.append(self.converToVenueModel(venueElement: mtr))
                    }

                    DispatchQueue.main.async {
                        self.venues = tempArray
                    }
                }

            }.resume()
        }
    }

    private func converToVenueModel(venueElement: VenueElement) -> VenueModel{
        return VenueModel(name: venueElement.venue.name,
                          distance: "\(venueElement.distance)m",
                          address: venueElement.venue.address,
                          status: arrangeWorkingTimes(startingHour: venueElement.venue.servingTimes[0].timeFrom,
                                                      endingHour: venueElement.venue.servingTimes[0].timeTo,
                                                      days: venueElement.venue.servingTimes[0].days))
    }

    private func arrangeWorkingTimes(startingHour: String, endingHour: String, days: [Int]) -> String{
        if isWorkingToday(days: days){
            if startingHour.toInt() > Calendar.current.component(.hour, from: Date()){
                return "Opens at \(startingHour)"
            }else if startingHour.toInt() - endingHour.toInt() != 0{
                return "Today \(startingHour) - \(endingHour)"
            }else{
                return "Today open 24"
            }
        }
        return "Closed"
    }

    private func isWorkingToday(days: [Int]) -> Bool{
        if let today = Date().dayNumberInWeek(){
            if days.contains(today){
                return true
            }
        }
        return false
    }
}

