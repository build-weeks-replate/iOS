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
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var foodController: FoodController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.todayLabel.text = todaysDate()
        
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createPressed(_ sender: Any) {
        guard let foodText = foodTextField.text,
              let descriptionText = descriptionTextField.text,
              let timeText = timeLabel.text else { return }
        
        self.foodController?.addDonation(name: foodText, time: timeText, description: descriptionText)
        self.dismiss(animated: true, completion: nil)
    }

    private func todaysDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        let today = formatter.string(from: date)
        return today
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TimeSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
    }
}

extension AddDonationViewController: DatePickerDelegate {
    func pickupTimeChosen(time: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let pickupTime = formatter.string(from: time).uppercased()
        
        self.timeLabel.text = pickupTime
    }
}
