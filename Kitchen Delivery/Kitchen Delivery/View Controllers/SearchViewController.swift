//
//  SearchViewController.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/04/20.
//

import UIKit
import Combine

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, SearchViewModelDelegate {
  
    
    private var cancellables : [AnyCancellable] = []
    
    
    let searchController =  UISearchController()
    
    @IBOutlet weak var SearchTableView: UITableView!
    
    
    @IBAction func BackBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SearchToHome", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        //searchController.searchResultsUpdater = self
        SearchTableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        SearchTableView.delegate = self
        SearchTableView.dataSource = self
        watch()
    
        
        
        
    }
    private lazy var viewModel = SearchViewModel(delegate: self, initial: KitchenServiceImplement())
    
  
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //viewModel.requestClear()
        print("Search clicked")
        guard let text = searchBar.text else{
            return
        }
        

        print(text)
       
       
        viewModel.requestInSearch(itemName: text)
        reloadView()
    }
    
    func watch(){
        let recieved = SearchFood.shared.$itemsInSearch
            .receive(on: DispatchQueue.main)
            .sink {  [weak self] _ in
                print("Reloading data")
                self?.reloadView()
                
            }
        cancellables.append(recieved)
    }
    
    func reloadView() {
        SearchTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countForSearch
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        
        let foodText = viewModel.itemName(itemAtIndex: indexPath.row)
        let foodImage = viewModel.itemImage(itemAtIndex: indexPath.row)
        
        customCell.configure(with: foodText, imageName: foodImage)
        //print("Adding to screen")
        return customCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
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
