//
//  SelectedItemInFridgeViewController.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/18.
//

import UIKit

class SelectedItemInViewController: UIViewController {
    @IBOutlet weak var selectedItemImage: UIImageView!
    @IBOutlet weak var SelectedItemName: UILabel!
    @IBOutlet weak var SelectedItemProtein: UILabel!
    @IBOutlet weak var SelectedItemFat: UILabel!
    @IBOutlet weak var SelectedItemCarbs: UILabel!
    @IBOutlet weak var SelectedItemFibre: UILabel!
    
    var name = ""
    var image = ""
    var protein = 0.0
    var fat = 0.0
    var carbohydrates = 0.0
    var Fibre = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageURL = URL(string: image){
            selectedItemImage.load(url: imageURL)
        }
        
        SelectedItemName.text = name
        SelectedItemProtein.text = "Protein: \(protein)"
        SelectedItemFat.text = "Fat: \(fat)"
        SelectedItemCarbs.text = "Carbohydrates: \(carbohydrates)"
        SelectedItemFibre.text = "Fibre: \(Fibre)"
     
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
