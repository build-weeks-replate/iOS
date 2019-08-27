//
//  Helper.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/27/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation


func todaysDate() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy"
    let today = formatter.string(from: date)
    return today
}
