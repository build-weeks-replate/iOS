//
//  AddDonationViewController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class AddDonationViewController: UIViewController {
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!

    var foodController: FoodController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createPressed(_ sender: Any) {
        guard let foodText = foodTextField.text,
             let descriptionText = descriptionTextField.text else { return }
        
        self.foodController?.addDonation(name: foodText, time: "10.00 PM", description: descriptionText)
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
