//
//  Volunteer.swift
//  Replate
//
//  Created by Fabiola S on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

struct Volunteer: Codable, Equatable {
    let username: String
    let password: String
    let organizationName: String
    let address: String
    let email: String
    let phone: Int
    
    init(username: String, password: String, email: String, phone: Int) {
        self.username = username
        self.password = password
        self.email = email
        self.phone = phone
        
        // Setting default values for organizationName & address, to only require Username, Password, Email & Phone when creating a volunteer
        organizationName = ""
        address = ""
    }
}
