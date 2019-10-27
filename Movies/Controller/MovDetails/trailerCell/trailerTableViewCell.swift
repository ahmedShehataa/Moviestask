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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let id = list[indexPath.row].key
        playInYoutube(youtubeId: id)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func playInYoutube(youtubeId: String) {
        if let youtubeURL = URL(string: "youtube://\(youtubeId)"),
            UIApplication.shared.canOpenURL(youtubeURL) {
            // redirect to app
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        } else if let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(youtubeId)") {
            // redirect through safari
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        }
    }
    
}
