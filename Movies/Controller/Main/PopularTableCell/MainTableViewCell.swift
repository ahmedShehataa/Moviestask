//
//  MainTableViewCell.swift
//  Movies
//
//  Created by Shehata on 10/25/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var headerMovArray = [MainResult]()
    var popularMovArray = [MainResult]()
    var cellViewController: ViewController!
    var cellIndex : Int!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topRatedCollectionView.register(UINib.init(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        

        
        topRatedCollectionView.delegate = self
        topRatedCollectionView.dataSource = self
        

        topRatedCateg()
        popularCateg()

    }
    
    @IBAction func ratedAllAction(_ sender: Any) {
        if(cellIndex == 0){
            ShowAllMoview(arr: headerMovArray,sort: 2)
        } else {
            ShowAllMoview(arr: popularMovArray,sort: 1)
        }
    }
    @IBAction func expandelRateAction(_ sender: Any) {
        let layout :UICollectionViewFlowLayout = (topRatedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)!
        
        if(layout.scrollDirection == .horizontal)
        {
            layout.scrollDirection = .vertical
            self.topRatedCollectionView.reloadData()
            cellViewController.tableCellHeight = 800
            cellViewController.cellLable = titleLabel.text
            cellViewController.CategTableView.reloadData()
        }
        else
        {
            layout.scrollDirection = .horizontal
            self.topRatedCollectionView.reloadData()
            cellViewController.tableCellHeight = 310
            cellViewController.cellLable = titleLabel.text
            cellViewController.CategTableView.reloadData()
            
        }
    }

    private func topRatedCateg(){
        let api_key = "6b2224a8468ad0b04b6b161d30e959f0"
        
        Network.shared.getData(MainMoviesModel.self, url: Urls.popular + "api_key=\(api_key)", parameters: nil, method: .get) { (error, data) in
            
            if let error = error {
                print(error)
            }else if let data = data {
                self.headerMovArray = data.results ?? []
                self.topRatedCollectionView.reloadData()
            }
        }
    }
    private func popularCateg(){
        let api_key = "6b2224a8468ad0b04b6b161d30e959f0"
        
        Network.shared.getData(MainMoviesModel.self, url: Urls.topRated + "api_key=\(api_key)", parameters: nil, method: .get) { (error, data) in
            if let error = error {
                print(error)
            }else if let data = data {
                self.popularMovArray = data.results ?? []
                self.topRatedCollectionView.reloadData()
            }
        }
    }
    
    
    private func ShowAllMoview(arr : [MainResult],sort : Int){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        vc.movArray = arr
        vc.sortType = sort
        cellViewController.navigationController?.pushViewController(vc, animated: true)
    }
}
    

extension MainTableViewCell : UICollectionViewDelegateFlowLayout , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if cellIndex == 0 {
            return headerMovArray.count
        }else{
            return popularMovArray.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = topRatedCollectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        if cellIndex == 0{
            cell.photo = headerMovArray[indexPath.row].posterPath
        }else if cellIndex == 1 {
            cell.photo = popularMovArray[indexPath.row].posterPath
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        if (indexPath.row == 0){
            vc.movId = headerMovArray[indexPath.row].id
        }else {
            vc.movId = popularMovArray[indexPath.row].id
        }
         cellViewController.navigationController?.pushViewController(vc, animated: true)
    }
    
}
