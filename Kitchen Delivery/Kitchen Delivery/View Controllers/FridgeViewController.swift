//
//  FridgeViewController.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/10.
//

import UIKit


class FridgeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FridgeViewModelDelegate  {
    
    
    @IBAction func BackToKitchen(_ sender: Any) {
        self.performSegue(withIdentifier: "FridgeToKitchen", sender: self)
    }
    @IBOutlet weak var FridgeGroceryView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FridgeGroceryView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        FridgeGroceryView.delegate = self
        FridgeGroceryView.dataSource = self
    }
    private lazy var viewModel = FridgeViewModel(delegate: self)
    
    func reloadView() {
        FridgeGroceryView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countForFridge
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        
        let foodText = viewModel.itemName(itemAtIndex: indexPath.row)
        let foodImage = viewModel.itemImage(itemAtIndex: indexPath.row)
       
        customCell.configure(with: foodText , imageName: foodImage)
        return customCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(identifier: "SelectedItemInViewController") as? SelectedItemInViewController{
            
            vc.name = viewModel.itemName(itemAtIndex: indexPath.row)
            vc.image = viewModel.itemImage(itemAtIndex: indexPath.row)
            vc.protein = viewModel.itemProtein(itemAtIndex: indexPath.row)
            vc.Fibre = viewModel.itemFibre(itemAtIndex: indexPath.row)
            vc.carbohydrates = viewModel.itemCarbs(itemAtIndex: indexPath.row)
            vc.fat = viewModel.itemFat(itemAtIndex: indexPath.row)
            
            present(vc, animated: true)
        }
        
        
    }
    

    
   
   
    
    

    
    
}





