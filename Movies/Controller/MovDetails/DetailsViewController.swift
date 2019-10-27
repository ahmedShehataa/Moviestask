//
//  DetailsViewController.swift
//  Movies
//
//  Created by Shehata on 10/24/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsTableView: UITableView!
    
    var movId : Int!
    var details : DetailsMovieModel?
    var cast = [Cast]()
    var trailer = [TrailerResult]()
    var reviews = [ReviewsResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movId!)
        
        detailsTableView.register(UINib.init(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTableViewCell")
        detailsTableView.register(UINib.init(nibName: "CastTBCellTableViewCell", bundle: nil), forCellReuseIdentifier: "CastTBCellTableViewCell")
        detailsTableView.register(UINib.init(nibName: "trailerTableViewCell", bundle: nil), forCellReuseIdentifier: "trailerTableViewCell")
        detailsTableView.register(UINib.init(nibName: "ReviewsTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewsTableViewCell")
        
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        
        getMovCast()
        getMovDetails()
        getMovTrailer()
        getMovReviews()
    }
    override func viewDidAppear(_ animated: Bool) {
        detailsTableView.reloadData()
    }
    private func getMovDetails() {
        let id = movId
        Network.shared.getData(DetailsMovieModel.self, url: Urls.main + "\(id!)?" + "api_key=\(Urls.api_key)", parameters: nil, method: .get) { (error, data) in
            if let err = error {
                self.showAlert(title: "error", message: err)
            } else if let dat = data{
                self.details = dat
                self.detailsTableView.reloadData()
                
            }
        }
    }
    private func getMovCast() {
        let id = movId
        Network.shared.getData(CastModel.self, url: Urls.main + "\(id!)/credits?" + "api_key=\(Urls.api_key)", parameters: nil, method: .get) { (error, data) in
            if let err = error {
                self.showAlert(title: "error", message: err)
            } else if let dat = data{
                self.cast = dat.cast ?? []
                self.detailsTableView.reloadData()
                
            }
        }
    }
    private func getMovTrailer() {
        let id = movId
        Network.shared.getData(TrailerModel.self, url: Urls.main + "\(id!)/videos?" + "api_key=\(Urls.api_key)", parameters: nil, method: .get) { (error, data) in
            if let err = error {
                self.showAlert(title: "error", message: err)
            } else if let dat = data{
                self.trailer = dat.results ?? []
                self.detailsTableView.reloadData()
                
            }
        }
    }
    private func getMovReviews() {
        let id = movId
        Network.shared.getData(ReviewsModel.self, url: Urls.main + "\(id!)/reviews?" + "api_key=\(Urls.api_key)", parameters: nil, method: .get) { (error, data) in
            if let err = error {
                self.showAlert(title: "error", message: err)
            } else if let dat = data{
                self.reviews = dat.results ?? []
                self.detailsTableView.reloadData()
                
            }
        }
    }
}
extension DetailsViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
            cell.detailsModel = details
            
            return cell
        } else if indexPath.row == 1 {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: "CastTBCellTableViewCell", for: indexPath) as! CastTBCellTableViewCell
            cell.castList = cast
            
            return cell
        }else if indexPath.row == 2 {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: "trailerTableViewCell", for: indexPath) as! trailerTableViewCell
            cell.trailerList = trailer
            return cell
        }
        else  {
            let cell = detailsTableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as! ReviewsTableViewCell
            cell.reviwsArr = reviews
            return cell
        }

    }
}

