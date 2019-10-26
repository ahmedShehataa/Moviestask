//
//  CastTBCellTableViewCell.swift
//  Movies
//
//  Created by Shehata on 10/26/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit

class CastTBCellTableViewCell: UITableViewCell {

    var list = [Cast]()
    var castList = [Cast](){
        didSet {
            list = castList
            castCollectionView.reloadData()
        }
    }
    

    @IBOutlet weak var castCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        castCollectionView.register(UINib.init(nibName: "CastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CastCollectionViewCell")
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension CastTBCellTableViewCell : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = castCollectionView.dequeueReusableCell(withReuseIdentifier: "CastCollectionViewCell", for: indexPath) as! CastCollectionViewCell
        if let path = list[indexPath.row].profilePath{
            cell.photo = list[indexPath.row].profilePath
            cell.CastName.text = list[indexPath.row].name
//            print(path)
        }else{
            
            cell.photo = "/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg"
            cell.CastName.text = list[indexPath.row].name
        }
        return cell
    }
    
}
