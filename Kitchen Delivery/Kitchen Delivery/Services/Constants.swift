//
//  Constants.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/07.
//

import Foundation


struct Constants{
    static let Usernamme = "Admin"
    static let Password = "TestPass123"
    //static let foodURL = URL(string: "https://edamam-food-and-grocery-database.p.rapidapi.com/parser?ingr=apple")
    static let apiKey = "f5c138d928msh4f57699c7827d52p1716e7jsn3546f8ce7b77"
    static let httpHeader = "X-RapidAPI-Key"
    static let cookieValue = "route=24d5f38cd7fceb10e7d4b90fb7e690f7"
    static let cookieHeader =  "Cookie"
    
    
    static func getRequest(foodRequest: String) -> String{
        
        return  "https://edamam-food-and-grocery-database.p.rapidapi.com/api/food-database/v2/parser?ingr=\(foodRequest)"
        
    }

}

