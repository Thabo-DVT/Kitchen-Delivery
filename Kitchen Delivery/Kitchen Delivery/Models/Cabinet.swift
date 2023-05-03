//
//  Cabinet.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/31.
//

import Foundation


class Cabinet{
    
    static let shared = Cabinet()
    
    private var itemsInCabinet : [Item]
    private var currentCapacity: Int
    
    private init(){
        self.itemsInCabinet = []
        self.currentCapacity = 0
    }
    
    func addItemToCabinet(tempItem: Item){
        itemsInCabinet.append(tempItem)
        currentCapacity += 1
    }
    
    
    func cabinetCapacity()-> Int{
        return currentCapacity
    }
    
    func cabinetItem(itemAtIndex : Int) -> Item{
        return itemsInCabinet[itemAtIndex]
    }
    
}
