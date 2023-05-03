//
//  Item.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/21.
//

import Foundation



class Item{
    
    var name: String?
    var image: String?
    var protein: Double?
    var fat: Double?
    var carbohydrates: Double?
    var Fibre: Double?
    
    init(groceryItem : Food) {
        guard let name = groceryItem.label , let image = groceryItem.image, let protein = groceryItem.nutrients?.procnt, let fat = groceryItem.nutrients?.fat, let carbohydrates = groceryItem.nutrients?.chocdf,let Fibre = groceryItem.nutrients?.fibtg else{
            return
        }
        self.name = name
        self.image = image
        self.protein = protein
        self.fat = fat
        self.carbohydrates = carbohydrates
        self.Fibre = Fibre
    }
    
    
    
}
