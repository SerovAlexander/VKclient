//
//  NewsVC.swift
//  VKClient
//
//  Created by Aleksandr Serov on 03/09/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var friendNews: [news] = [news1, news2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.getNews(token: Session.shared.token)
        
      newsTableView.register(UINib(nibName: "NewsXIBCell", bundle: nil), forCellReuseIdentifier: "NewsXIBCell")
    self.newsTableView.dataSource = self
    }
}

extension NewsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsXIBCell" ) as! NewsXIBCell
        cell.setupWithNews(friendNews[indexPath.row])
        return cell
    }
}
