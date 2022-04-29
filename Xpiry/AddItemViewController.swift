//
//  AddItemViewController.swift
//  Xpiry
//
//  Created by Jason Kenneth on 28/04/22.
//

import UIKit

struct Items {
    
    var name: String?
    var category: String?
    var expDate: String?
    
    init(names: String, categories:String, dates: String) {
        name = names
        category = categories
        expDate = dates
    }
}

class AddItemViewController: UIViewController {
    
    var date: String?
    var items = Items(names: "", categories: "", dates: "")
    
    
    @IBOutlet weak var expDate: UIDatePicker!
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var categoryField: UITextField!
    
    var itemNames = ""
    var categoryNames: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Item"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .done,
            target: self,
            action: #selector(dismissMe))
        
    }
    
    @objc func dismissMe() {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func expDateSelect(_ sender: Any) {
        let datestyle = DateFormatter()
        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "d MMM yyyy"
        date = datestyle.string(from: expDate.date)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        if let name = itemField.text, let category = categoryField.text { //needs work
         //   data.append(Items(names: name, categories: category, dates: dates))
            items.name = name
            items.category = category
            if date == nil {
                let datestyle = DateFormatter()
                datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
                datestyle.locale = NSLocale.current
                datestyle.dateFormat = "d MMM yyyy"
                date = datestyle.string(from: Date())
                items.expDate = date
            } else {
                items.expDate = date
            }

        }
 
    }
    
}

//if dates == nil {
//    let datestyle = DateFormatter()
//    datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
//    datestyle.locale = NSLocale.current
//    datestyle.dateFormat = "d MMM yyyy"
//    date = datestyle.string(from: Date())
//    items.expDate = date
//}else{
//    items.expDate = dates
