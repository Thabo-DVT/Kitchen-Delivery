//
//  KetoMealsViewController.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/22.
//

import UIKit

class KetoMealsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BreakfastBTN(_ sender: UIButton) {
       
        if let url = URL(string: "https://www.youtube.com/watch?v=O8z6EFUufD0&ab_channel=RuledMe") {
             UIApplication.shared.open(url, options: [:])
         }
        
    }
    
    @IBAction func BackBTN(_ sender: UIButton) {
        print("Pressed")
        self.performSegue(withIdentifier: "KetoMealsToDietMeals" , sender: self)
    }
    @IBAction func LunchBTN(_ sender: UIButton) {
        if let url = URL(string: "https://www.youtube.com/watch?v=FkzeiCDlK8U&ab_channel=JustStartedToCook") {
             UIApplication.shared.open(url, options: [:])
         }
        
    }
    
    
    @IBAction func DinnerBTN(_ sender: UIButton) {
        if let url = URL(string: "https://www.youtube.com/watch?v=sqelF9LaAlQ&ab_channel=RecipeTinEats") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
