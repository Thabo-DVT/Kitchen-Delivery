//
//  LoginViewModel.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/31.
//

import Foundation


protocol LoginViewModelDelegate: AnyObject{
    func navToLandingPage()
    func showError(error:String)
}


class LoginViewModel{
    private weak var delegate: LoginViewModelDelegate?
    private let initial: KitchenService
    
    init(delegate: LoginViewModelDelegate, initial: KitchenService) {
        self.delegate = delegate
        self.initial = initial
    }
    
    func logUserIn(_ userName: String, _ password: String) -> Bool{
        if userName == "Admin" && password == "TestPass123"{
            
            initial.sendRequestForFridge(foodItem: "Chicken")
            initial.sendRequestForFridge(foodItem: "Cheese")
            initial.sendRequestForFridge(foodItem: "Beef")
            initial.sendRequestForFridge(foodItem: "Mayo")
            initial.sendRequestForCabinet(foodItem: "Salt")
            initial.sendRequestForCabinet(foodItem: "Pepper")
            initial.sendRequestForCabinet(foodItem: "Ketchup")
            initial.sendRequestForCabinet(foodItem: "Mustard")
            
            
            delegate?.navToLandingPage()
            return true
        }
        delegate?.showError(error: "Enter Correct Username or Password")
        return false
    }
    
    
}
