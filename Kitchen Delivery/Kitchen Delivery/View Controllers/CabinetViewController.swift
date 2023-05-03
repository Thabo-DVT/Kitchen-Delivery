//
//  CabinetViewController.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/12.
//

import Foundation
import UIKit

class CabinetViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, CabinetViewModelDelegate {
   
    
     
    
    @IBOutlet weak var CabinetGroceryView: UITableView!
    
    @IBAction func BackToKitchen(_ sender: Any) {
        self.performSegue(withIdentifier: "CabinetToKitchen", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CabinetGroceryView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        CabinetGroceryView.delegate = self
        CabinetGroceryView.dataSource = self
    }
    private lazy var viewModel = CabinetViewModel(delegate: self)
    
    func reloadview() {
        CabinetGroceryView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countForCabinet
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        
        let foodText = viewModel.itemName(itemAtIndex: indexPath.row)
        let foodImage = viewModel.itemImage(itemAtIndex: indexPath.row)
        
        customCell.configure(with: foodText, imageName: foodImage)
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
