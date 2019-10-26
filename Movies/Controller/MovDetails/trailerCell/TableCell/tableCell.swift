//
//  tableCell.swift
//  Movies
//
//  Created by Shehata on 10/26/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell {

    @IBOutlet weak var videoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
