//
//  FridgeViewModel.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/03.
//

import Foundation

protocol FridgeViewModelDelegate: AnyObject{
    func reloadView()
}

class FridgeViewModel{
    private weak var delegate: FridgeViewModelDelegate?
    
    init(delegate: FridgeViewModelDelegate) {
        self.delegate = delegate

    }
    var countForFridge : Int {
        get{return Fridge.shared.fridgeCapacity()}
    }
    
    
    func itemName(itemAtIndex: Int) -> String{
        guard let nameOfItem = Fridge.shared.fridegeItem(itemAtIndex: itemAtIndex).name else{
            return "Details not available"
        }
        return nameOfItem
    }
    
    func itemImage(itemAtIndex: Int) -> String{
        guard let imageOfItem = Fridge.shared.fridegeItem(itemAtIndex: itemAtIndex).image else{
            return "Details not available"
        }
        return imageOfItem
    }
    
    
    func itemProtein(itemAtIndex: Int) -> Double{
        guard let proteinOfItem = Fridge.shared.fridegeItem(itemAtIndex: itemAtIndex).protein else{
            return 0.0
        }
        return proteinOfItem
    }
    func itemFat(itemAtIndex: Int) -> Double{
        guard let fatOfItem = Fridge.shared.fridegeItem(itemAtIndex: itemAtIndex).fat else{
            return 0.0
        }
        return fatOfItem
    }
    
    func itemCarbs(itemAtIndex: Int) -> Double{
        guard let carbsOfItem = Fridge.shared.fridegeItem(itemAtIndex: itemAtIndex).carbohydrates else{
            return 0.0
        }
        return carbsOfItem
    }
    
 
    func itemFibre(itemAtIndex: Int) -> Double{
        guard let fibreOfItem = Fridge.shared.fridegeItem(itemAtIndex: itemAtIndex).Fibre else{
            return 0.0
        }
        return fibreOfItem
    }
     
    
    
    
}
