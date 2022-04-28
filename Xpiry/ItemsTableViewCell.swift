//
//  ItemsTableViewCell.swift
//  Xpiry
//
//  Created by Jason Kenneth on 28/04/22.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var expiryDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
