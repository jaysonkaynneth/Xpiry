//
//  ViewController.swift
//  Xpiry
//
//  Created by Jason Kenneth on 27/04/22.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {

    let searchBar = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dashboard"
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBtn))
    }
    
    @objc func addBtn() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addItemVC = storyboard.instantiateViewController(identifier: "AddItemID")
        addItemVC.modalTransitionStyle = .coverVertical
        present(addItemVC, animated: true, completion: nil)
        
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

