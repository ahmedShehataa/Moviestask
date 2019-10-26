//
//  CatCollectionViewCell.swift
//  Movies
//
//  Created by Shehata on 10/24/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit
import Alamofire

class CatCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var MovLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        MovLogo.contentMode = .scaleToFill
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        MovLogo.layer.cornerRadius = 10
    }
    var photo: String? {
        didSet {
            guard let photo = photo else { return }
            
            // download image
            Alamofire.request(Urls.baseImage + photo).response { response in
                if let data = response.data, let image = UIImage(data: data) {
                    self.MovLogo.image = image
                }
            }
        }
    }
}
