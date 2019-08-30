//
//  DashboardCollectionViewController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/22/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DashboardCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var todaysDateLabel: UILabel!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    let foodController = FoodController()
    let userManager = UserManager.shared
    
    // Telling search controller for using the same view to display the results by using nil value
    let searchController = UISearchController(searchResultsController: nil)
    
    // Hold the food items that the user is searching for
    var filteredFood = [FoodItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.todaysDateLabel.text = Date().dateString().uppercased()
        
        // User Type Dashboard
        switch userManager.userType {
        case .business:
            foodController.foodItems = aBusiness(UserManager.shared.businessOwner.organizationName)

        case .volunteer:
            navigationItem.rightBarButtonItems?.removeFirst()
            // Setup the search controller
            // Allows the class to be informed as text changes within the UISearchBar
            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Search Food or Business"
            navigationItem.searchController = searchController
            // Ensure the search bar does not remain on the screen if the user navigates to another view controller
            definesPresentationContext = true
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
        // removing the line
        self.navigationController?.navigationBar.shouldRemoveShadow(true)

    }
    
    // MARK: - Private Functions
    
    func aBusiness(_ name: String) -> [FoodItem] {
        let foodItems = self.foodController.foodItems
        
        return foodItems.filter { (foodItem) -> Bool in
            foodItem.organization_name == name
        }
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredFood = foodController.foodItems.filter({( foodItem: FoodItem) -> Bool in
            return foodItem.name.lowercased().contains(searchText.lowercased()) ||
                foodItem.organization_name?.lowercased().contains(searchText.lowercased()) == true
        })
        
        collectionView.reloadData()
    }

    // Filtering results or not
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let detailVC = segue.destination as? DetailViewController {
                guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
                
                let item: FoodItem
                if isFiltering() {
                    item = filteredFood[indexPath.item]
                } else {
                    item = foodController.foodItems[indexPath.item]
                }
                
                detailVC.foodItem = item
                detailVC.foodController = foodController
            }
            
        }
        else if segue.identifier == "AddSegue" {
            if let nc = segue.destination as? UINavigationController {
                let addVC = nc.topViewController as? AddDonationViewController
                addVC?.foodController = self.foodController
            }
        } 
    }
 
    
    @IBAction func addPressed(_ sender: Any) {
    }
    
    @IBAction func settingsPressed(_ sender: Any) {
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredFood.count
        }
        
        return foodController.foodItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as? FoodItemCollectionViewCell else { return UICollectionViewCell() }
        
        let food: FoodItem
        if isFiltering() {
            food = filteredFood[indexPath.item] // search view
        } else {
            food = foodController.foodItems[indexPath.item] // volunteer dashboard
        }
        
        cell.imageView.image = UIImage(named: "\(food.name.lowercased())") ?? UIImage(named: "no title")
        cell.titleLabel.text = food.name
        cell.timeLabel.text = food.time
        cell.businessLabel.text = food.organization_name
        cell.businessLabel.isHidden = UserManager.shared.userType == .business
        cell.claimedView.isHidden = !food.is_claimed

        return cell
    }
    
    @IBAction func unwindToDashboard(_ sender: UIStoryboardSegue) {
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

//extensions for responding the search bar
extension DashboardCollectionViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension UINavigationBar {
    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}
