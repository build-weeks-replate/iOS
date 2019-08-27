//
//  SignInViewController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var loginUsernameTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showPasswordPressed(_ sender: UIButton) {
        loginPasswordTextField.isSecureTextEntry.toggle()
        if loginPasswordTextField.isSecureTextEntry == false {
            sender.setTitle("HIDE", for: .normal)
        } else {
            sender.setTitle("SHOW", for: .normal)
        }
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        
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
        loginUsernameTextField.addLeftPadding(10)
        loginPasswordTextField.addLeftPadding(10)
    }
}
