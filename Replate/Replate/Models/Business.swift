//
//  Business.swift
//  Replate
//
//  Created by Fabiola S on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

struct Business: Codable, Equatable {
    var username: String
    var password: String
    var organizationName: String
    var address: String
    var email: String
    var phone: Int
    
    init(username: String, email: String, password: String ) {
        self.username = username
        self.email = email
        self.password = password
        organizationName = ""
        address = ""
        phone = 0
    }
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case organizationName = "organization_name"
        case address
        case email
        case phone
    }
}
