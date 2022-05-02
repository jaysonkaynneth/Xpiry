//
//  ViewController.swift
//  Xpiry
//
//  Created by Jason Kenneth on 27/04/22.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
//    weak var delegate:AddMoviesToController?
    
    var data = [Items]()
    var tempName = ""
    let searchBar = UISearchController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Dashboard"
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBtn))
        rightBarButtonItem.tintColor = .init(red: 93/255, green: 162/255, blue: 113/255, alpha: 100)
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        
        

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemsTableViewCell)!
        cell.itemName.text = data[indexPath.row].name
        cell.expiryDate.text = data[indexPath.row].expDate
        return cell
        
    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? AddItemViewController {
            self.data.append(sourceViewController.items) 
            updateView()
        }
    }
    
    func updateView() {
        print(data)
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView,
                      trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
       {
           let deleteItem = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
               
               DispatchQueue.main.async {
                   self.showDeleteWarning(for: indexPath)
               }
               
               success(true)
           })
           deleteItem.backgroundColor = .red
           return UISwipeActionsConfiguration(actions: [deleteItem])
       }
    
    func showDeleteWarning(for indexPath: IndexPath) {
        let deleteAlert = UIAlertController(title: "Are you sure?", message: "This action cannot be undone", preferredStyle: UIAlertController.Style.alert)

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            DispatchQueue.main.async {
                self.data.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        deleteAlert.addAction(deleteAction)
        present(deleteAlert, animated: true, completion: nil)
    }
    
    @objc func addBtn() {
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

