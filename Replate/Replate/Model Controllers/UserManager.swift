//
//  UserManager.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/28/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    
    // Change the type to see the dashboard
    var userType: UserType = .business
    
    // Dummy Business Name
    var businessOwner: Business = Business(username: "bestprice", email: "bestprice@gmail.com", password:"bp123")
    
    private init() {
        businessOwner.organizationName = "Tompskin Square Bagel"
    }
}
