//
//  CabinetViewModel.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/12.
//

import Foundation



protocol CabinetViewModelDelegate: AnyObject{
    func reloadview()
}


class CabinetViewModel{
    private weak var delegate: CabinetViewModelDelegate?
    
    init(delegate: CabinetViewModelDelegate) {
        self.delegate = delegate
    }
    
    var countForCabinet : Int {
        get{return Cabinet.shared.cabinetCapacity() }
    }
    
    func itemName(itemAtIndex: Int) -> String {
        guard let nameOfItem = Cabinet.shared.cabinetItem(itemAtIndex: itemAtIndex).name else{
            return "Details not available"
        }
        //print(nameOfItem)
        return nameOfItem
    }
    
    func itemImage(itemAtIndex: Int) -> String{
        guard let imageOfItem = Cabinet.shared.cabinetItem(itemAtIndex: itemAtIndex).image else{
            return "Details not available"
        }
        
        //print(imageOfItem)
         
        return imageOfItem
    }
    
    
    func itemProtein(itemAtIndex: Int) -> Double{
        guard let proteinOfItem = Cabinet.shared.cabinetItem(itemAtIndex: itemAtIndex).protein else{
            return 0.0
        }
        return proteinOfItem
    }
    func itemFat(itemAtIndex: Int) -> Double{
        guard let fatOfItem = Cabinet.shared.cabinetItem(itemAtIndex: itemAtIndex).fat else{
            return 0.0
        }
        return fatOfItem
    }
    
    func itemCarbs(itemAtIndex: Int) -> Double{
        guard let carbsOfItem = Cabinet.shared.cabinetItem(itemAtIndex: itemAtIndex).carbohydrates else{
            return 0.0
        }
        return carbsOfItem
    }
    
 
    func itemFibre(itemAtIndex: Int) -> Double{
        guard let fibreOfItem = Cabinet.shared.cabinetItem(itemAtIndex: itemAtIndex).Fibre else{
            return 0.0
        }
        return fibreOfItem
    }
    
    
}
