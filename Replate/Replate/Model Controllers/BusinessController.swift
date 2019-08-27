//
//  BusinessController.swift
//  Replate
//
//  Created by Fabiola S on 8/23/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation
import UIKit

class BusinessController {
    private(set) var businesses: [Business] = []
    var business = Business(username: "", email: "", password: "")
    
    func createBusinessFirstPage(username: String, email: String, password: String, organizationName: String?, address: String?, cityStateZip: String?, phone: Int?) {
        business.username = username
        business.email = email
        business.password = password
        
        guard let businessName = organizationName,
            let businessAddress = address,
            let businessCityStateZip = cityStateZip,
            let businessPhone = phone else { return }
        
        business.organizationName = businessName
        business.address = "\(businessAddress) \(businessCityStateZip)"
        business.phone = businessPhone
        
        businesses.append(business)
        print(business)
    }  
}

