//
//  AddItemViewController.swift
//  Xpiry
//
//  Created by Jason Kenneth on 28/04/22.
//

import UIKit

struct Items {
    
    var name: String?
    var expDate: String?
    
    init(names: String, dates: String) {
        name = names
        expDate = dates
    }
}

class AddItemViewController: UIViewController {
    
    var date: String?
    var items = Items(names: "", dates: "")
    
    
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

        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)

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
        if let name = itemField.text {
            items.name = name
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

