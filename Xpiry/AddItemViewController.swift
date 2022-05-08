//
//  AddItemViewController.swift
//  Xpiry
//
//  Created by Jason Kenneth on 28/04/22.
//

import UIKit

//struct Items: Codable {
//    
//    var name: String?
//    var expDate: String?
//    
//    init(names: String, dates: String) {
//        name = names
//        expDate = dates
//    }
//}

class AddItemViewController: UIViewController {

    var date: String?
//    var items = Items(names: "", dates: "")
    let defaults = UserDefaults.standard
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var expDate: UIDatePicker!
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    var itemNames = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Item"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .done,
            target: self,
            action: #selector(dismissMe))
        
        textFieldCheck()
       
    }
    
    @objc func dismissMe() {
        self.dismiss(animated: true)
    }
    
    func textFieldCheck() {
        addBtn.isHidden = true
        itemField.addTarget(self, action: #selector(validator),
                                    for: .editingChanged)

       }
    
    @objc func validator(sender: UITextField) {

        guard
          let item = itemField.text, !item.isEmpty
          else
        {
          self.addBtn.isHidden = true
          return
        }
        addBtn.isHidden = false
       }
    
    @IBAction func expDateSelect(_ sender: Any) {
        let datestyle = DateFormatter()
        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "d MMM yyyy"
        date = datestyle.string(from: expDate.date)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        let datestyle = DateFormatter()
        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "d MMM yyyy"
        let addItem = Item(context: self.context)
        addItem.name = itemField.text
        addItem.expiry_date = date
        
        do {
                try context.save()
                
            } catch {
                
            }
        
//        if let name = itemField.text {
//            items.name = name
//            if date == nil {
//                let datestyle = DateFormatter()
//                datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
//                datestyle.locale = NSLocale.current
//                datestyle.dateFormat = "d MMM yyyy"
//                date = datestyle.string(from: Date())
//                items.expDate = date
//            } else {
//                items.expDate = date
//            }
//        }
    }
    
    
    
//    func saveData() {
//        let encoder = JSONEncoder()
//        if let encodededItem = try? encoder.encode(items) {
//            defaults.set(encodededItem, forKey: "item")
//        }
//    }
//    
//    func loadData() {
//
//    }
    
}


