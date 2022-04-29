//
//  EditItemViewController.swift
//  Xpiry
//
//  Created by Jason Kenneth on 29/04/22.
//

import UIKit

class EditItemViewController: UIViewController {
    
    @IBOutlet weak var expDate: UIDatePicker!
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var categoryField: UITextField!

    var itemNames: String?
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
        let date = datestyle.string(from: expDate.date)
        
        print(date)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        itemNames = itemField.text
        categoryNames = categoryField.text
        performSegue(withIdentifier: "toDash", sender: nil)
    }
    
    @IBAction func delBtn(_ sender: Any) {

        print("deleted")
        performSegue(withIdentifier: "toDash", sender: nil)
    }

}
