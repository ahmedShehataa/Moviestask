//
//  MainCollectionViewCell.swift
//  Movies
//
//  Created by Shehata on 10/23/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit
import Alamofire

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var MovIV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        MovIV.contentMode = .scaleToFill
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        MovIV.layer.cornerRadius = 10
    }
    var photo: String? {
        didSet {
            guard let photo = photo else { return }
            
            // download image
            Alamofire.request(Urls.baseImage + photo).response { response in
                if let data = response.data, let image = UIImage(data: data) {
                    self.MovIV.image = image
                }
            }
        }
    }
}
