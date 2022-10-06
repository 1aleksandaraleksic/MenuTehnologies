//
//  Login.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 5.10.22..
//

import Foundation

struct LoginModel: Codable{
    let email: String
    let password: String

    init(email: String, password: String){
        self.email = email
        self.password = password
    }
}
