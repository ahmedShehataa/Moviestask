//
//  CastCollectionViewCell.swift
//  Movies
//
//  Created by Shehata on 10/26/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit
import Alamofire

class CastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var CastIV: UIImageView!
    @IBOutlet weak var CastName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        CastIV.contentMode = .scaleToFill
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        CastIV.layer.cornerRadius = CastIV.frame.width / 2
    }
    var photo: String? {
        didSet {
            guard let photo = photo else { return }
            
            // download image
            Alamofire.request(Urls.baseImage + photo).response { response in
                if let data = response.data, let image = UIImage(data: data) {
                    self.CastIV.image = image
                }
            }
        }
    }
}
