//
//  FoodModel.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/12.
//


import Foundation

struct Grocery: Codable {
    let hints: [Hint]?
    
}

struct Hint: Codable {
    let food: Food?
    
}

struct Food: Codable {
    
    let label: String?
    let nutrients: Nutrients?
    let image: String?
   
}

struct Nutrients: Codable {
    let enercKcal: Double?
    let procnt, fat, chocdf: Double?
    let fibtg: Double?
    enum CodingKeys: String, CodingKey {
        case enercKcal = "ENERC_KCAL"
        case procnt = "PROCNT"
        case fat = "FAT"
        case chocdf = "CHOCDF"
        case fibtg = "FIBTG"
    }
}


