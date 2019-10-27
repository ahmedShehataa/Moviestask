//
//  CategoryViewController.swift
//  Movies
//
//  Created by Shehata on 10/24/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {


    var movArray = [MainResult]()
    var sortType : Int!
    
    @IBOutlet weak var categCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if sortType == 1{
            let Popular = NSLocalizedString("Popular Movies", comment: "popular")
            setupRemainingNavItems(title: Popular)
        }else {
            let topRated = NSLocalizedString("Top Rated Movies", comment: "top rated")
            setupRemainingNavItems(title: topRated)

        }

        
        
        categCollectionView.register(UINib.init(nibName: "CatCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CatCollectionViewCell")
        categCollectionView.delegate = self
        categCollectionView.dataSource = self
    }
    
    
}
extension CategoryViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categCollectionView.dequeueReusableCell(withReuseIdentifier: "CatCollectionViewCell", for: indexPath) as! CatCollectionViewCell
        cell.photo = movArray[indexPath.row].posterPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            vc.movId = movArray[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
