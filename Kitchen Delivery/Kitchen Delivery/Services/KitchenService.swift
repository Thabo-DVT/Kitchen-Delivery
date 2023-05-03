//
//  KitchenService.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/03.
//

import Foundation




protocol KitchenService: AnyObject{
    func sendRequestForFridge(foodItem: String)
    func sendRequestForCabinet(foodItem: String)
    func sendRequestForSearch(foodItem: String)

}


class KitchenServiceImplement: KitchenService{
    
    
    private func buildURL(foodRequest: String) -> URL?{
        
        return  URL(string: "https://edamam-food-and-grocery-database.p.rapidapi.com/api/food-database/v2/parser?ingr=\(foodRequest)")
        
    }
    
    
    func sendRequestForFridge(foodItem : String){
        URLSession.shared.makeRequest(url: buildURL(foodRequest: foodItem), model: Grocery.self){ result in
            
            switch result{
            case .success(let foodArray):
                
                
                if let tempItem = foodArray.hints{
                    for x in tempItem{
                        if let foodItem = x.food{
                            Fridge.shared.addItemToFridge(tempItem: Item(groceryItem: foodItem ))
                            break
                        }
                        
                    }
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func sendRequestForCabinet(foodItem : String){
        
        URLSession.shared.makeRequest(url: buildURL(foodRequest: foodItem), model: Grocery.self){ result in
            
            switch result{
            case .success(let foodArray):
                
                
                if let tempItem = foodArray.hints{
                    for x in tempItem{
                        if let foodItem = x.food{
                            Cabinet.shared.addItemToCabinet(tempItem: Item(groceryItem: foodItem ))
                            break
                        }
                        
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func sendRequestForSearch(foodItem : String){
    
        
        var temp : [Item]
        temp = []
        URLSession.shared.makeRequest(url: buildURL(foodRequest: foodItem), model: Grocery.self){ result in
            
            switch result{
            case .success(let foodArray):
                
                
                if let tempItem = foodArray.hints{
                    for x in tempItem{
                        if let foodItem = x.food{
                            //print("Added")
                        temp.append(Item(groceryItem: foodItem))
                         
                            
                        }
                        
                    }
                    
                }
                SearchFood.shared.replace(temp: temp)
                
                
                
               
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
   
    
}





