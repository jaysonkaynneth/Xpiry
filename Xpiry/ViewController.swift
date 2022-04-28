//
//  ViewController.swift
//  Xpiry
//
//  Created by Jason Kenneth on 27/04/22.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    var data = [Items]()
    let searchBar = UISearchController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Dashboard"
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBtn))

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemsTableViewCell)!
        cell.itemName.text = AddItemViewController().itemNames
        cell.expiryDate.text = "\(AddItemViewController().expDate)"
        return cell
        
    }
    
    @objc func addBtn() {
//      let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addItemVC = storyboard?.instantiateViewController(identifier: "AddItemID") as! AddItemViewController
        addItemVC.modalPresentationStyle = .popover

        let navigationController = UINavigationController(rootViewController: addItemVC)
        
        navigationController.navigationBar.tintColor = .init(red: 93/255, green: 162/255, blue: 113/255, alpha: 100)
        
        present(navigationController, animated: true)
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text
        else {
            return
        }
//        let searchResult = searchController.searchResultsController as? SearchResultViewController
        
        print(text)
        
    }
    
}

