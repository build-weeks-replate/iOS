//
//  FoodItem.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

struct FoodItem: Codable, Equatable {
    let id: String = UUID().uuidString
    var name: String
    var time: String
    var description: String
    var is_claimed: Bool 
    let pickup_date: String
    
    // temporary until we have the API
    var organization_name: String?
    
    init(name: String, time: String, description: String, is_claimed: Bool, pickup_date: String, organization_name: String? = "") {
        self.name = name
        self.time = time
        self.description = description
        self.pickup_date = pickup_date
        self.is_claimed = false
        self.organization_name = organization_name
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, time, description, is_claimed, pickup_date, organization_name
    }
}
