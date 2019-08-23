//
//  SignUpThreeViewController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class SignUpThreeViewController: UIViewController {
    
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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Helper Functions
    func updateViews() {
        updateTextFields()
    }
    
    func updateTextFields() {
        if self.view.tag == 0 {
            businessNameTextField.addLeftPadding(10)
            businessAddressTextField.addLeftPadding(10)
            businessCityStateZipCodeTextField.addLeftPadding(10)
            businessPhoneNumberTextField.addLeftPadding(10)
        } else {
            volunteerPhoneNumberTextField.addLeftPadding(10)
        }
    }

}
