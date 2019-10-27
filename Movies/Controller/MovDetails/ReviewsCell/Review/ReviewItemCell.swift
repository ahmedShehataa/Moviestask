//
//  ReviewItemCell.swift
//  Movies
//
//  Created by Shehata on 10/27/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit

class ReviewItemCell: UITableViewCell {

    @IBOutlet weak var autherLabel: UILabel!
    @IBOutlet weak var reviewTF: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
