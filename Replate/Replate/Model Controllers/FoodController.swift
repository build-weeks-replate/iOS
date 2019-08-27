//
//  FoodController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/23/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

class FoodController {
    var foodItems: [FoodItem] = []
    
    func data() {
        for i in 1...5 {
            var is_claimed = false
            
            if i % 2 == 0 {
                is_claimed = true
            }
            
            let foodItem = FoodItem(name: "Bagels", time: "09:00PM", description: "Donated to Bowery", is_claimed: is_claimed, pickup_date: "Aug 23")
            foodItems.append(foodItem)
        }
    }
    
    func addDonation(name: String, time: String, description: String) {
        let foodItem = FoodItem(name: name, time: time, description: description, is_claimed: false, pickup_date: "Aug 26")
        foodItems.append(foodItem)
    }
    
    func editDonation(id: String, name: String, time: String, description: String) -> FoodItem? {
        // get the index by searching from the id
        guard let index = self.foodItems.firstIndex(where: { item in item.id == id }) else { return nil }
        
        var foodItem = self.foodItems[index]
        foodItem.name = name
        foodItem.time = time
        foodItem.description = description
        
        // set it back
        self.foodItems[index] = foodItem
        return foodItem
    }
    
    func claimToggle(id: String) -> FoodItem? {
        guard let index = self.foodItems.firstIndex(where: { item in item.id == id }) else { return nil }

        var foodItem = self.foodItems[index]
        foodItem.is_claimed.toggle()
        self.foodItems[index] = foodItem
        return foodItem
    }
}
