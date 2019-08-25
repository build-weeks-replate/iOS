//
//  DetailViewController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var foodItem: FoodItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.foodLabel.text = foodItem?.name
        self.addressLabel.text = "1234 Massachusetts Ave"
        self.timeLabel.text = foodItem?.time
        self.phoneLabel.text = "321-456-7891"
        self.descriptionLabel.text = foodItem?.description
        
//        self.navigationItem.backBarButtonItem?.title = "Change"
        // Do any additional setup after loading the view.
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
