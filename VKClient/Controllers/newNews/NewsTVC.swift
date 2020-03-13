//
//  NewsTVC.swift
//  VKClient
//
//  Created by Aleksandr Serov on 24.02.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import RealmSwift

class NewsTVC: UITableViewController {
    
    var token: NotificationToken?
    private lazy var news =  try? Realm().objects(News.self)

    private let dateFormater: DateFormatter = {
        let dF = DateFormatter()
        dF.dateFormat = "HH:mm dd-MM-yyyy"
        return dF
    }()
    private var dateCache = [IndexPath: String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        NetworkService.getNews{[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let news):
                DataBase.save(items: news)
            case .failure(let error):
                fatalError(error.localizedDescription)
                
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return news?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTopXIBCell", for: indexPath) as! NewsTopXIBCell
        guard let news = news?[indexPath.section] else { return cell }
        
        let dateString: String = dateCache[indexPath] ?? {
            let dateString = dateFormater.string(from: news.date)
            dateCache[indexPath] = dateString
            return dateString
            }()
        cell.configure(with: news, dateString: dateString)
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTextCell", for: indexPath) as! NewsTextCell
        guard let news = news?[indexPath.section] else { return cell }
        
        cell.configure(with: news)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsContentCell", for: indexPath) as! NewsContentCell
        
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFooterCell", for: indexPath) as! NewsFooterCell
         guard let news = news?[indexPath.section] else { return cell }
        cell.configure(with: news)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            if let cell = cell as? NewsContentCell {
                cell.collectionView.dataSource = self
                cell.collectionView.reloadData()
            }
        }
    }
}

extension NewsTVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsContentCollectionViewCell", for: indexPath) as! NewsContentCollectionViewCell
        guard let photo = news?[indexPath.section].postPhoto.first?.sizes else { return cell }
        guard let news = news?[indexPath.section] else { return cell }
        
        var photoSize: Size = photo[0]
        for size in photo {
            if size.type == "y" {
                photoSize = size
                break
            }
        }
        cell.configure(with: news, and: photoSize)
        
            return cell
    }
    
    
}
