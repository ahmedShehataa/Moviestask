//
//  trailerTableViewCell.swift
//  Movies
//
//  Created by Shehata on 10/26/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit

class trailerTableViewCell: UITableViewCell {

    var list = [TrailerResult]()
    var trailerList = [TrailerResult](){
        didSet{
            list = trailerList
            trailerTableView.reloadData()
        }
    }
    
    @IBOutlet weak var trailerTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        trailerTableView.register(UINib.init(nibName: "tableCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        
        trailerTableView.delegate = self
        trailerTableView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension trailerTableViewCell : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trailerTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! tableCell
        cell.videoLabel.text = list[indexPath.row].name
        return cell
    }
    
    
}
