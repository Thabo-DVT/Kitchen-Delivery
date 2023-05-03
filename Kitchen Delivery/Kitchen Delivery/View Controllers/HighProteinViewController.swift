//
//  HighProteinViewController.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/23.
//

import UIKit

class HighProteinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func HPBreakfastBTN(_ sender: UIButton) {
        if let url = URL(string: "https://www.youtube.com/watch?v=dLairfd8bZU&ab_channel=Felu-Fitbycooking") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    
    @IBAction func HPLunchBTN(_ sender: UIButton) {
        if let url = URL(string: "https://www.youtube.com/watch?v=qQq33CEzTic&ab_channel=Felu-Fitbycooking") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    
    
    @IBAction func HPDinnerBTN(_ sender: UIButton) {
        if let url = URL(string: "https://www.youtube.com/watch?v=CiNtYiBt2oQ&ab_channel=EssenRezepte") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    
    
    @IBAction func BackBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "HPToDietFoods", sender: self)
    }
    
    
    

}
