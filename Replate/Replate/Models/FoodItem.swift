//
//  FoodItem.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

struct FoodItem {
    let id: String = UUID().uuidString
    var name: String
    var time: String
    var description: String
    var is_claimed: Bool 
    let pickup_date: String
}
