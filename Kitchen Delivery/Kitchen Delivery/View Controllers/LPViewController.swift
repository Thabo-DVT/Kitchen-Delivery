//
//  LPViewController.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/10.
//

import UIKit




class LPViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    @IBAction func KitchenBTN(_ sender: Any) {
        self.performSegue(withIdentifier: "LPtoKitchen", sender: self)
    }
    
    @IBAction func SearchBTN(_ sender: Any) {
        self.performSegue(withIdentifier: "LPToSearch", sender: self)
        
//        print("Pressed search")
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "Search") as? SearchViewController{
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    @IBAction func DietBTN(_ sender: Any) {
        self.performSegue(withIdentifier: "LPToDietFoods", sender: self)
    }
    
    @IBAction func LogoutBTN(_ sender: Any) {
        self.performSegue(withIdentifier: "WIP", sender: self)
    }
    
}
