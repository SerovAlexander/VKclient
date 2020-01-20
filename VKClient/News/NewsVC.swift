////
////  NewsVC.swift
////  VKClient
////
////  Created by Aleksandr Serov on 03/09/2019.
////  Copyright © 2019 mac. All rights reserved.
////
//
import UIKit
import RealmSwift

class NewsVC: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    var token: NotificationToken?
    private lazy var news =  try? Realm().objects(News.self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let news = realm.objects(News.self)
        self.token = news.observe { change in
            switch change {
            case .initial(let result):
                self.newsTableView.reloadData()
                
            case let .update(results, indexesDelete, indexesInsert, Indexesmodifications):
                self.newsTableView.beginUpdates()
                self.newsTableView.insertRows(at: indexesInsert.map{IndexPath(row: $0, section: 0)}, with: .none)
                self.newsTableView.deleteRows(at: indexesDelete.map{IndexPath(row: $0, section: 0)}, with: .none)
                self.newsTableView.reloadRows(at: Indexesmodifications.map{IndexPath(row: $0, section: 0)}, with: .none)
                self.newsTableView.endUpdates()
                
            case .error:
                print("error")
            }
            
        }
        
        
        NetworkService.getNews{[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let news):
                DataBase.save(items: news)
            case .failure(let error):
                fatalError(error.localizedDescription)
                
            }
            
        }
        newsTableView.register(UINib(nibName: "NewsXIBCell", bundle: nil), forCellReuseIdentifier: "NewsXIBCell")
        self.newsTableView.dataSource = self
    }
}

extension NewsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsXIBCell" ) as! NewsXIBCell
        guard let news = news?[indexPath.row] else {return cell}
        
        cell.configure(with: news)
        
        return cell
    }
}
