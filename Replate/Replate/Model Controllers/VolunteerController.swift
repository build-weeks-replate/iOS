//
//  VolunteerController.swift
//  Replate
//
//  Created by Fabiola S on 8/23/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation
import UIKit

class VolunteerController {
    private(set) var volunteers: [Volunteer] = []
    var volunteer = Volunteer(username: "", password: "", email: "")
    
    func createVolunteerFirstPage(username: String, email: String, password: String, phone: Int?) {
        volunteer.username = username
        volunteer.email = email
        volunteer.password = password
        
        guard let volunteerPhone = phone else { return }
        volunteer.phone = volunteerPhone
        
        volunteers.append(volunteer)
        print(volunteer)
    }
}
