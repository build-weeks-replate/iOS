//
//  DatePickerViewController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/25/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func pickupTimeChosen(time: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func savePressed(_ sender: Any) {
        self.delegate?.pickupTimeChosen(time: self.datePicker.date)
        self.navigationController?.popViewController(animated: true)
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
