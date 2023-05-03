//
//  SearchItem.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/21.
//

import Foundation
import Combine


class SearchFood {
    
    static let shared = SearchFood()
    //Refactor after the demo to move to the viewModel.
    @Published  private (set) var  itemsInSearch : [Item]
    private var currentCapacity : Int
    
    init() {
        self.itemsInSearch = []
        currentCapacity = 0
    }
    
    
    func addItemToSearch(tempItem: Item){
        itemsInSearch.append(tempItem)
        currentCapacity += 1
    }
    
    
    func SearchCapacity()-> Int{
        return currentCapacity
    }
    
    
    
    func searchItem(itemAtIndex : Int) -> Item{
        return itemsInSearch[itemAtIndex]
    }
    
    func clear(){
        if(currentCapacity > 0){
            itemsInSearch.removeAll()
            
        }
    }
        
        func replace(temp : [Item]){
        print("Inside Replace")
            itemsInSearch.removeAll()
            itemsInSearch.append(contentsOf: temp)
            currentCapacity = temp.count
            print("Items Appended")
            
            
        }
        
        
    
}
