//
//  DetailsTableViewCell.swift
//  Movies
//
//  Created by Shehata on 10/24/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit
import Alamofire

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var backdropIV: UIImageView!
    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var minsLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var overViewText: UITextView!
    
    var detailsModel : DetailsMovieModel! {
        didSet {

            print(detailsModel?.originalTitle ?? "vvvvvvvvvvb")
            backdropPhoto = detailsModel?.backdropPath
            logoPhoto = detailsModel?.posterPath
            nameLabel.text = detailsModel?.originalTitle
            tagLineLabel.text = detailsModel?.tagline
            if let min = detailsModel?.runtime {
                minsLabel.text = "\(String(describing: min)) mins"}
            if let review = detailsModel?.voteAverage , let vote = detailsModel?.voteCount{
                    reviewLabel.text = String(describing: review) + "\(String(describing: vote)) Reviews"
            }

            overViewText.text = detailsModel?.overview
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backdropIV.contentMode = .scaleToFill
        logoIV.contentMode = .scaleToFill
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        logoIV.layer.cornerRadius = 10
    }
    var backdropPhoto: String? {
        didSet {
            guard let photo = backdropPhoto else { return }
            
            // download image
            Alamofire.request(Urls.baseImage + photo).response { response in
                if let data = response.data, let image = UIImage(data: data) {
                    self.backdropIV.image = image
                }
            }
        }
    }
    var logoPhoto: String? {
        didSet {
            guard let photo = logoPhoto else { return }
            
            // download image
            Alamofire.request(Urls.baseImage + photo).response { response in
                if let data = response.data, let image = UIImage(data: data) {
                    self.logoIV.image = image
                }
            }
        }
    }
}
