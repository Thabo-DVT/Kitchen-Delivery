//
//  KitchenViewController.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/10.
//


import UIKit


class KitchenViewController: UIViewController {
    
    
    
    @IBAction func BackToHomeBTN(_ sender: Any) {
        self.performSegue(withIdentifier: "BackFromKitchen", sender: self)
    }
    
    @IBAction func FridgeBTN(_ sender: Any) {
        self.performSegue(withIdentifier: "KitchenToFridge", sender: self)
        
    }
    @IBAction func CabinetBTN(_ sender: Any) {
        self.performSegue(withIdentifier: "KitchenToCabinet", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
