//
//  BookedCell.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 02/02/22.
//

import UIKit

class BookedCell: UITableViewCell {
    
    @IBOutlet weak var customerNameLabel : UILabel!
    @IBOutlet weak var hotelNameLabel : UILabel!
    @IBOutlet weak var totalCostLabel : UILabel!
    @IBOutlet weak var dates : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
