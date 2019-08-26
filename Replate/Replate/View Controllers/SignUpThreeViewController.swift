//
//  SignUpThreeViewController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class SignUpThreeViewController: UIViewController {
    
    var businessController = BusinessController()
    var volunteerController = VolunteerController()
    var businesses: [Business] = []
    // MARK: Business Sign up Outlets
    @IBOutlet weak var businessNameTextField: UITextField!
    @IBOutlet weak var businessAddressTextField: UITextField!
    @IBOutlet weak var businessCityStateZipCodeTextField: UITextField!
    @IBOutlet weak var businessPhoneNumberTextField: UITextField!
    
    
    // MARK: Volunteer Sign up Outlets
    @IBOutlet weak var volunteerPhoneNumberTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Storyboard Actions
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        createUser()
    }
    

    
    // MARK: - Navigation


    
    // MARK: Helper Functions
    func updateViews() {
        updateTextFields()
    }
    
    func updateTextFields() {
        if self.view.tag == 0 {
            businessNameTextField.addLeftPadding(20)
            businessAddressTextField.addLeftPadding(20)
            businessCityStateZipCodeTextField.addLeftPadding(20)
            businessPhoneNumberTextField.addLeftPadding(20)
        } else {
            volunteerPhoneNumberTextField.addLeftPadding(20)
        }
    }
    
    
    func createUser() {
        if self.view.tag == 0 {
            guard let businessName = businessNameTextField.text,
                let businessAddress = businessAddressTextField.text,
                let businessCityStateZip = businessCityStateZipCodeTextField.text,
                let businessPhone = businessPhoneNumberTextField.text,
                let phone = Int(businessPhone) else { return }
            
            businessController.business.organizationName = businessName
            businessController.business.address = "\(businessAddress)\n\(businessCityStateZip)"
            businessController.business.phone = phone
            
            print(businessController.business)
        } else if self.view.tag == 1 {
            guard let volunteerPhone = volunteerPhoneNumberTextField.text,
                let phone = Int(volunteerPhone) else { return }
            volunteerController.volunteer.phone = phone
            print(volunteerController.volunteer)
        }
    }

}
