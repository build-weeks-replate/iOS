//
//  EditDonationViewController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: AnyObject {
    func didUpdateFoodItem(item: FoodItem?)
}

class EditDonationViewController: UIViewController {
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var foodItem: FoodItem?
    var foodController: FoodController?
    weak var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.foodTextField.text = foodItem?.name
        self.descriptionTextField.text = foodItem?.description
        self.dateLabel.text = todaysDate()
        self.timeLabel.text = foodItem?.time
        self.addressLabel.text = "1234 Massachusetts Ave"
        self.phoneLabel.text = "321-456-7891"
    }
    
    private func todaysDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        let today = formatter.string(from: date)
        return today
    }
    
    @IBAction func updatePressed(_ sender: Any) {
        guard let foodText = foodTextField.text,
            let descriptionText = descriptionTextField.text,
            let timeText = timeLabel.text,
            let id = foodItem?.id else { return }
        
        let newItem = self.foodController?.editDonation(id: id, name: foodText, time: timeText, description: descriptionText)
        self.navigationController?.popViewController(animated: true)
        self.delegate?.didUpdateFoodItem(item: newItem)
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

extension EditDonationViewController: DatePickerDelegate {
    func pickupTimeChosen(time: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let pickupTime = formatter.string(from: time).uppercased()
        
        self.timeLabel.text = pickupTime
    }
}
