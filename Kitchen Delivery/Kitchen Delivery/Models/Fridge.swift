//
//  Fridge.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/20.
//

import Foundation

class Fridge{
    static let shared = Fridge()
    
   private var itemsInFridge : [Item]
//   private var fullCaptaciy: Int
   private var currentCapacity: Int
    
   private init() {
        self.itemsInFridge = []
//        self.fullCaptaciy = 20
        self.currentCapacity = 0
    }
    func addItemToFridge(tempItem: Item){
        itemsInFridge.append(tempItem)
        currentCapacity += 1
    }
    
    func fridgeCapacity()->Int{
        return currentCapacity
    }
    
    func fridegeItem(itemAtIndex : Int) -> Item{
    return itemsInFridge[itemAtIndex]
    }
    
    

}
