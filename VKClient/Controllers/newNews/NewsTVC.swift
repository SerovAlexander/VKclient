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
        return 1
//            news?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTopXIBCell", for: indexPath) as! NewsTopXIBCell
//        if indexPath.row == 0 {
//        guard let news = news?[indexPath.row] else { return cell }
//
//        let dateString: String = dateCache[indexPath] ?? {
//            let dateString = dateFormater.string(from: news.date)
//            dateCache[indexPath] = dateString
//            return dateString
//            }()
//
//        cell.configure(with: news, dateString: dateString)
//        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
//
//        return cell
//        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTextCell", for: indexPath) as! NewsTextCell
//            guard let news = news?[indexPath.section] else { return cell }
//
//            cell.configure(with: news)
//            return cell
//
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFooterCell", for: indexPath) as! NewsFooterCell
        return cell
        
    }
    
    
}
