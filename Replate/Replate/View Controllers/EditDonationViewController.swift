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
    @IBOutlet weak var scrollView: UIScrollView!
    
    var foodItem: FoodItem?
    var foodController: FoodController?
    weak var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.foodTextField.delegate = self
        self.descriptionTextField.delegate = self

        self.foodTextField.text = foodItem?.name
        self.descriptionTextField.text = foodItem?.description
        self.dateLabel.text = Date().dateString()
        self.timeLabel.text = foodItem?.time
        self.addressLabel.text = "1234 Massachusetts Ave"
        self.phoneLabel.text = "321-456-7891"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // removing the line
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updatePressed(_ sender: Any) {
        guard let foodText = foodTextField.text,
            let descriptionText = descriptionTextField.text,
            let timeText = timeLabel.text,
            let id = foodItem?.id else { return }
        
        let newItem = self.foodController?.editDonation(id: id, name: foodText, time: timeText, description: descriptionText)
        self.dismiss(animated: true, completion: nil)
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

extension EditDonationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.foodTextField {
            self.descriptionTextField.becomeFirstResponder()
        }
        
        if textField == self.descriptionTextField {
            self.descriptionTextField.resignFirstResponder()
        }
        
        return true
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
}

