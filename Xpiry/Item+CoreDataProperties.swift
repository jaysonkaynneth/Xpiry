//
//  Item+CoreDataProperties.swift
//  Xpiry
//
//  Created by Jason Kenneth on 08/05/22.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var expiry_date: String?

}

extension Item : Identifiable {

}
