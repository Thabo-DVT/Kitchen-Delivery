//
//  DietFoodsViewController.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/20.
//

import UIKit

class DietFoodsViewController: UIViewController {


    @IBAction func KetoBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DietsFoodsToKeto", sender: self)
    }
    
    @IBAction func HighProteinBTN(_ sender: Any) {
        self.performSegue(withIdentifier:"DietsFoodsToVegan" , sender: self)
    }
    
    @IBAction func VeganBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "WIP", sender: self)
    }
    
    
    @IBAction func BackToHomeBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DietFoodsToHome", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
