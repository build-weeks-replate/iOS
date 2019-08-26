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
    @IBOutlet weak var claimButton: UIButton!
    
    var foodItem: FoodItem?
    var foodController: FoodController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        self.foodLabel.text = foodItem?.name
        self.addressLabel.text = "1234 Massachusetts Ave"
        self.timeLabel.text = foodItem?.time
        self.phoneLabel.text = "321-456-7891"
        self.descriptionLabel.text = foodItem?.description
        self.navigationItem.title = "Tompskin Bagel"
        claimStatus()
    }
    
    @IBAction func claimPressed(_ sender: Any) {
        guard let foodItem = self.foodItem else { return }
        
        if foodItem.is_claimed {
            showAlert()
        }
        
        self.foodItem = self.foodController?.claimToggle(id: foodItem.id)
        claimStatus()
        self.navigationController?.popViewController(animated: true)
    }
    
    // checking donation status
    private func claimStatus() {
        guard let foodItem = self.foodItem else { return }
        if foodItem.is_claimed {
            self.claimButton.backgroundColor = .gray
            self.claimButton.setTitle("Claimed", for: .normal)
        } else {
            self.claimButton.backgroundColor = UIColor(red: 249/255, green: 160/255, blue: 31/255, alpha: 1)
            self.claimButton.setTitle("Claim It", for: .normal)
        }
    }
    
    // confirmation for unclaiming the donation
    private func showAlert() {
        let alert = UIAlertController(title: "Are you sure you want to unclaim this donation?", message: "Once you unclaim it, this post will be released to other volunteers.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditSegue" {
            if let editVC = segue.destination as? EditDonationViewController {
                editVC.foodItem = self.foodItem
                editVC.foodController = self.foodController
                editVC.delegate = self
            }
        }
    }

}

extension DetailViewController: EditViewControllerDelegate {
    func didUpdateFoodItem(item: FoodItem?) {
        self.foodItem = item
        updateViews()
    }
}
