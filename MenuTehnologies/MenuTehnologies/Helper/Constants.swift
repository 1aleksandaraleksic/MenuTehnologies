//
//  Constants.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 5.10.22..
//

import Foundation

public class Constants{

    static var shared = Constants()

    private let baseURL = "https://api-qa.menu.app/api"

    func loginURL(jsonData: Data) -> URLRequest?{
        if let url = URL(string: baseURL + "/customers/login"){
            var request = createRequest(url: url)
            request.httpBody = jsonData
            return request
        }
        return nil
    }

    func listOfVenuesURL(jsonData: Data) -> URLRequest?{
        if let url = URL(string: baseURL + "/directory/search"){
            var request = createRequest(url: url)
            request.httpBody = jsonData
            return request
        }
        return nil
    }

    private func createRequest(url: URL) -> URLRequest{
        var request = URLRequest(url: url)
            request.httpMethod = "POST"
                                // mobile-application
            request.setValue("55c2b09be425e25719f6c9950a281a35", forHTTPHeaderField: "application")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("123456", forHTTPHeaderField: "Device-UUID")
            request.setValue("3.7.0", forHTTPHeaderField: "Api-Version")
        return request
    }

}
