//
//  ViewController.swift
//  Xpiry
//
//  Created by Jason Kenneth on 27/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate {
    
    var data = [Item]()
    var searchedItem = [Item]()
    var date: String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let searchBar = UISearchController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let defaults = UserDefaults.standard
        
        tableView.delegate = self
        tableView.dataSource = self
//        searchBar.delegate = self
        
        title = "Items"
//        searchBar.searchResultsUpdater = self
//        navigationItem.searchController = searchBar
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBtn))
        rightBarButtonItem.tintColor = .init(red: 93/255, green: 162/255, blue: 113/255, alpha: 100)
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        fetchItem()
        
 
        
//        if let savedItemData = defaults.object(forKey: "item") as? Data {
//            let decoder = JSONDecoder()
//            if let savedData = try? decoder.decode(Items.self, from: savedItemData) {
//                print("Saved item: \(savedData)")
//            }
//        }
        
    }
    
    func fetchItem() {
        do {
            
            data = try context.fetch(Item.fetchRequest())
            DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                
            } catch {
                
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemsTableViewCell)!
        cell.selectionStyle = .none
        cell.itemName.text = data[indexPath.row].name
        
        let datestyle = DateFormatter()
        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "d MMM yyyy"
        let currDate = datestyle.string(from: Date())
        let stringToDate = datestyle.date(from: data[indexPath.row].expiry_date ?? currDate)
        
        cell.expiryDate.text = datestyle.string(from: stringToDate!)
        
        if Date() >= stringToDate ?? Date() {
            cell.backgroundColor = .init(red: 218/255, green: 85/255, blue: 82/255, alpha: 100)
        } else {
            cell.backgroundColor = .none
        }

        return cell
        
    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? AddItemViewController {
//            self.data.append(sourceViewController.items) 
            updateView()
        }
    }
    
    func updateView() {
        //print(data)
        fetchItem()
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
           deleteItem.backgroundColor = .init(red: 218/255, green: 85/255, blue: 82/255, alpha: 100)
           return UISwipeActionsConfiguration(actions: [deleteItem])
       }
    
    func showDeleteWarning(for indexPath: IndexPath) {
        let deleteAlert = UIAlertController(title: "Are you sure?", message: "This action cannot be undone", preferredStyle: UIAlertController.Style.alert)

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            DispatchQueue.main.async {
                self.context.delete(self.data[indexPath.row])
                do {
                    try self.context.save()
                        
                    } catch {
                        
                    }
                self.data.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil)
        })
        

        
        deleteAlert.addAction(deleteAction)
        deleteAlert.addAction(cancelAction)
        
        present(deleteAlert, animated: true, completion: nil)
    }
    
    @objc func addBtn() {
        let addItemVC = storyboard?.instantiateViewController(identifier: "AddItemID") as! AddItemViewController
        addItemVC.modalPresentationStyle = .popover

        let navigationController = UINavigationController(rootViewController: addItemVC)
        
        navigationController.navigationBar.tintColor = .init(red: 93/255, green: 162/255, blue: 113/255, alpha: 100)
        
        present(navigationController, animated: true)
    }

//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text
//        else {
//            return
//        }
//        let searchResult = searchController.searchResultsController as? SearchResultViewController
        
//        print(text)
        
//    }
    
}

