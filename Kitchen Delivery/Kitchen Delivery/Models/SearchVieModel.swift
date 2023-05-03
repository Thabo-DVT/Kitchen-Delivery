//
//  SearchVieModel.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/21.
//

import Foundation


protocol SearchViewModelDelegate: AnyObject{
    func reloadView()
}

class SearchViewModel{
    private weak var delegate: SearchViewModelDelegate?
    private let initial: KitchenService
    
//    init(delegate: SearchViewModelDelegate) {
//        self.delegate = delegate
//    }
    
    init(delegate: SearchViewModelDelegate, initial: KitchenService) {
        self.delegate = delegate
        self.initial = initial
    }
    
    var countForSearch : Int{
        get{return SearchFood.shared.SearchCapacity()}
    }
    
    func itemName(itemAtIndex: Int) -> String{
        guard let nameOfItem = SearchFood.shared.searchItem(itemAtIndex: itemAtIndex).name else{
            return "Details not found"
        }
        return nameOfItem
    }
    
    func itemImage(itemAtIndex: Int) -> String{
        guard let imageItem = SearchFood.shared.searchItem(itemAtIndex: itemAtIndex).image else{
            return "Details not available"
        }
        return imageItem
    }
    
    func itemProtein(itemAtIndex: Int) -> Double{
        guard let proteinOfItem = SearchFood.shared.searchItem(itemAtIndex: itemAtIndex).protein else{
            return 0.0
        }
        return proteinOfItem
    }
    func itemFat(itemAtIndex: Int) -> Double{
        guard let fatOfItem = SearchFood.shared.searchItem(itemAtIndex: itemAtIndex).fat else{
            return 0.0
        }
        return fatOfItem
    }
    
    func itemCarbs(itemAtIndex: Int) -> Double{
        guard let carbsOfItem = SearchFood.shared.searchItem(itemAtIndex: itemAtIndex).carbohydrates else{
            return 0.0
        }
        return carbsOfItem
    }
    
 
    func itemFibre(itemAtIndex: Int) -> Double{
        guard let fibreOfItem = SearchFood.shared.searchItem(itemAtIndex: itemAtIndex).Fibre else{
            return 0.0
        }
        return fibreOfItem
    }
    
    
    func requestInSearch(itemName: String) {
        initial.sendRequestForSearch(foodItem: itemName)
        
    }
    
    
    func requestClear(){
        SearchFood.shared.clear()
    }
    
    
    
    
    
}
