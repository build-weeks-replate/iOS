//
//  SignUpTwoViewController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class SignUpTwoViewController: UIViewController {
    
    // MARK: Properties
    var businessController = BusinessController()
    var newBusiness: Business = Business(username: "", email: "", password: "")
    
    // MARK: Business Sign up Outlets
    @IBOutlet weak var businessUsernameTextField: UITextField!
    @IBOutlet weak var businessEmailTextField: UITextField!
    @IBOutlet weak var businessPasswordTextField: UITextField!
    @IBOutlet weak var businessConfirmPasswordTextField: UITextField!
    @IBOutlet weak var businessShowPassword: UIButton!
    @IBOutlet weak var businessShowConfirmPassword: UIButton!
    
    // MARK: Volunteer Sign Up Outlets
    @IBOutlet weak var volunteerUsernameTextField: UITextField!
    @IBOutlet weak var volunteerEmailTextField: UITextField!
    @IBOutlet weak var volunteerPasswordTextField: UITextField!
    @IBOutlet weak var volunteerConfirmPasswordTextField: UITextField!
    @IBOutlet weak var volunteerShowPassword: UIButton!
    @IBOutlet weak var volunteerShowConfirmPassword: UIButton!
    
    // MARK: Outlets for Business & Volunteer
    @IBOutlet weak var nextPagePressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Storyboard Actions
    
    @IBAction func showPasswordPressed(_ sender: UIButton) {
        toggleShowPassword(sender)
    }
    
    @IBAction func showConfirmPasswordPressed(_ sender: UIButton) {
        toggleShowConfirmPassword(sender)
    }
    
    
    @IBAction func nextPagePressed(_ sender: UIButton) {
        passwordsDontMatch()
        if self.view.tag == 0 {
            //Working on creating object when pressing "next" button to complete with textFields
            guard let username = businessUsernameTextField.text,
                let email = businessEmailTextField.text,
                let password = businessPasswordTextField.text else { return }
            newBusiness.username = username
            newBusiness.email = email
            newBusiness.password = password
        }
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BusinessSignUpPageTwo" {
            guard let businessSignUpTwoVC = segue.destination as? SignUpThreeViewController else { return }
            businessSignUpTwoVC.businessController = businessController
        }
     }
    

    // MARK: Unwind
    @IBAction func unwindToSignUpTwo(_ sender: UIStoryboardSegue) {
    }
    
    // MARK: Helper Functions
    func updateViews() {
        updateTextFields()
    }
    
    func updateTextFields() {
        if self.view.tag == 0 {
            businessUsernameTextField.addLeftPadding(20)
            businessEmailTextField.addLeftPadding(20)
            businessPasswordTextField.addLeftPadding(20)
            businessConfirmPasswordTextField.addLeftPadding(20)
        } else {
            volunteerUsernameTextField.addLeftPadding(20)
            volunteerEmailTextField.addLeftPadding(20)
            volunteerPasswordTextField.addLeftPadding(20)
            volunteerConfirmPasswordTextField.addLeftPadding(20)
        }
    }
    
    func toggleShowPassword(_ sender: UIButton) {
        if self.view.tag == 0 {
            businessPasswordTextField.isSecureTextEntry.toggle()
            if businessPasswordTextField.isSecureTextEntry == false {
                sender.setTitle("HIDE", for: .normal)
            } else {
                sender.setTitle("SHOW", for: .normal)
            }
        } else {
            volunteerPasswordTextField.isSecureTextEntry.toggle()
            if volunteerPasswordTextField.isSecureTextEntry == false {
                sender.setTitle("HIDE", for: .normal)
            } else {
                sender.setTitle("SHOW", for: .normal)
            }
        }
    }
    
    func toggleShowConfirmPassword(_ sender: UIButton) {
        if self.view.tag == 0 {
            businessConfirmPasswordTextField.isSecureTextEntry.toggle()
            if businessConfirmPasswordTextField.isSecureTextEntry == false {
                sender.setTitle("HIDE", for: .normal)
            } else {
                sender.setTitle("SHOW", for: .normal)
            }
        } else {
            volunteerConfirmPasswordTextField.isSecureTextEntry.toggle()
            if volunteerConfirmPasswordTextField.isSecureTextEntry == false {
                sender.setTitle("HIDE", for: .normal)
            } else {
                sender.setTitle("SHOW", for: .normal)
            }
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
