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

