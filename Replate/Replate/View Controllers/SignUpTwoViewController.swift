//
//  SignUpTwoViewController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class SignUpTwoViewController: UIViewController {
    
    // MARK: Business Sign up Outlets
    @IBOutlet weak var businessUsernameTextField: UITextField!
    @IBOutlet weak var businessEmailTextField: UITextField!
    @IBOutlet weak var businessPasswordTextField: UITextField!
    @IBOutlet weak var businessConfirmPasswordTextField: UITextField!
    
    // MARK: Volunteer Sign Up Outlets
    @IBOutlet weak var volunteerUsernameTextField: UITextField!
    @IBOutlet weak var volunteerEmailTextField: UITextField!
    @IBOutlet weak var volunteerPasswordTextField: UITextField!
    @IBOutlet weak var volunteerConfirmPasswordTextField: UITextField!

    // MARK: Outlets for Business & Volunteer
    @IBOutlet weak var nextPagePressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextFields()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Storyboard Actions
    
    @IBAction func showPasswordPressed(_ sender: UIButton) {
    }
    
    @IBAction func showConfirmPasswordPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func nextPagePressed(_ sender: UIButton) {
        passwordsDontMatch()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    // MARK: Unwind
    @IBAction func unwindToSignUpTwo(_ sender: UIStoryboardSegue) {
        
    }
    
    // MARK: Helper Functions
    func updateTextFields() {
        if self.view.tag == 0 {
        businessUsernameTextField.addLeftPadding(10)
        businessEmailTextField.addLeftPadding(10)
        businessPasswordTextField.addLeftPadding(10)
        businessConfirmPasswordTextField.addLeftPadding(10)
        } else {
        volunteerUsernameTextField.addLeftPadding(10)
        volunteerEmailTextField.addLeftPadding(10)
        volunteerPasswordTextField.addLeftPadding(10)
        volunteerConfirmPasswordTextField.addLeftPadding(10)
        }
    }
    
    func passwordsDontMatch() {
        
        if nextPagePressed.tag == 0 {
            if businessPasswordTextField.text != businessConfirmPasswordTextField.text {
                let alertController = UIAlertController(title: "Passwords don't match", message: "Please re-type password", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        } else {
            if volunteerPasswordTextField.text != volunteerConfirmPasswordTextField.text {
                let alertController = UIAlertController(title: "Passwords don't match", message: "Please re-type password", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    

}
