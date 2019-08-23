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

    @IBOutlet weak var nextPagePressed: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    // MARK: Unwind
    @IBAction func unwindToSignUpTwo(_ sender: UIStoryboardSegue) {
        
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
    
    func passwordsDontMatch() {
        
        if nextPagePressed.tag == 0 {
            if businessPasswordTextField.text != businessConfirmPasswordTextField.text {
                let alertController = UIAlertController(title: "Passwords don't match", message: "Please re-type password", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        } else if nextPagePressed.tag == 1 {
            if volunteerPasswordTextField.text != volunteerConfirmPasswordTextField.text {
                let alertController = UIAlertController(title: "Passwords don't match", message: "Please re-type password", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    

}
