//
//  Item.swift
//  Xpiry
//
//  Created by Jason Kenneth on 28/04/22.
//

import Foundation

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
