//
//  NewsVC.swift
//  VKClient
//
//  Created by Aleksandr Serov on 03/09/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RealmSwift

class NewsVC: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    private lazy var news =  try? Realm().objects(News.self
    )
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
        guard let new = news?[indexPath.row] else {return cell}
        cell.textField.text = new.newsText
        cell.dataLabel.text = String(new.date)

        return cell
    }
}
