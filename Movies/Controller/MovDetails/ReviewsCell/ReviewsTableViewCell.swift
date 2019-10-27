//
//  ReviewsTableViewCell.swift
//  Movies
//
//  Created by Shehata on 10/27/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewsTableView: UITableView!
    var reviwsArr = [ReviewsResult](){
        didSet{
            reviewsTableView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        reviewsTableView.register(UINib.init(nibName: "ReviewItemCell", bundle: nil), forCellReuseIdentifier: "ReviewItemCell")
        reviewsTableView.delegate = self
        reviewsTableView.dataSource = self
    }

    
}
extension ReviewsTableViewCell : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviwsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewsTableView.dequeueReusableCell(withIdentifier: "ReviewItemCell", for: indexPath) as! ReviewItemCell
        cell.autherLabel.text = reviwsArr[indexPath.row].author
        cell.reviewTF.text = reviwsArr[indexPath.row].content
        return cell
    }
    
    
}
