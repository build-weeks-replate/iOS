//
//  FoodController.swift
//  Replate
//
//  Created by Vici Shaweddy on 8/23/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

class FoodController {
    var foodItems: [FoodItem] = [
        FoodItem(name: "Bagels", time: "09:00 PM", description: "Donated to Bowery.", is_claimed: false, pickup_date: "\(Date().dateString())"),
        FoodItem(name: "Pizza", time: "09:30 PM", description: "Quantity 10 boxes.", is_claimed: false, pickup_date: "\(Date().dateString())"),
        FoodItem(name: "Fried Chicken", time: "10:30 PM", description: "Call to the store before pick up time.", is_claimed: false, pickup_date: "\(Date().dateString())"),
        FoodItem(name: "Cookies", time: "06:30 PM", description: "5 boxes left", is_claimed: false, pickup_date: "\(Date().dateString())"),
        FoodItem(name: "Beef Wraps", time: "05:00 PM", description: "Drop off at Dress Up For Success organization.", is_claimed: false, pickup_date: "\(Date().dateString())"),
        FoodItem(name: "Cupcakes", time: "07:30 PM", description: "We have 20 boxes.", is_claimed: false, pickup_date: "\(Date().dateString())"),
        FoodItem(name: "Fruits", time: "07:30 PM", description: "5 platters.", is_claimed: false, pickup_date: "\(Date().dateString())"),
        FoodItem(name: "Sandwiches", time: "05:30 PM", description: "Bowery Mission requested this to be dropped off.", is_claimed: false, pickup_date: "\(Date().dateString())"),
    ]
    
    func addDonation(name: String, time: String, description: String) {
        let foodItem = FoodItem(name: name, time: time, description: description, is_claimed: false, pickup_date: "\(Date().dateString())")
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
