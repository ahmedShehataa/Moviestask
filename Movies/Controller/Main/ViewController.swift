//
//  ViewController.swift
//  Movies
//
//  Created by Shehata on 10/23/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var CategTableView: UITableView!
    var tableCellHeight : CGFloat!
    var cellLable : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRightNavItems()
        setupRemainingNavItems(title: "The Movies")

        CategTableView.register(UINib.init(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")

        CategTableView.delegate = self
        CategTableView.dataSource = self
        tableCellHeight = 310
        
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if cellLable == "Top Rated" {
            if(indexPath.row == 0){
                return tableCellHeight
            } else {
                return 310
            }
        }else if cellLable == "Popular" {
            if(indexPath.row == 1){
                return tableCellHeight
            } else {
                return 310
            }
        }

        return 310
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CategTableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell

        if indexPath.row == 0{
            cell.cellIndex = 0
            cell.titleLabel.text = "Top Rated"
        }else {
            cell.cellIndex = 1
            cell.titleLabel.text = "Popular"
        }

        cell.cellViewController = self
        return cell
    }
    
    
}


extension UIViewController {
    
     func setupRemainingNavItems(title :String) {
        let titleView = UILabel()
        titleView.text = title
        titleView.textColor = UIColor.red
        titleView.font = UIFont(name: "HelveticaNeue",
                                size: 20.0)
        titleView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        titleView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleView
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
     func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "ic_home_24px").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 14, height: 14)
        searchButton.contentMode = .scaleAspectFit

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
    }
    func showAlert(title: String?, message: String?) {
        let alertCOntroller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertCOntroller.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        
        self.present(alertCOntroller, animated: true, completion: nil)
    }
}
