//
//  Business.swift
//  Replate
//
//  Created by Fabiola S on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

struct Business: Codable, Equatable {
    let username: String
    let password: String
    let organizationName: String
    let address: String
    let email: String
    let phone: Int
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case organizationName = "organization_name"
        case address
        case email
        case phone
    }
}
