//
//  NewsContentCell.swift
//  VKClient
//
//  Created by Aleksandr Serov on 01.03.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher

class NewsContentCell: UITableViewCell {
    
    
    
    
    
    @IBOutlet weak var postImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.postImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.postImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.postImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.postImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.postImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    public func configure(with news: News?, and size: Size) {
        
        guard var sourceId = news?.sourceId else { return }
        var postImageUrl: String = ""
        guard sourceId != 0 else { return }
        if sourceId > 0 {
            if news == nil {
                return
            }
            guard let sourceDB = try? Realm().objects(User.self).filter("id == %@", sourceId),
                let user = sourceDB.first
                else { return }
            postImageUrl = size.url
            
        } else {
            sourceId = -sourceId
            if news == nil {
                return
            }
            guard let sourceDB = try? Realm().objects(Items.self).filter("id == %@", sourceId),
                let group = sourceDB.first
                else {return}
            postImageUrl = size.url
        }
        
        postImage?.kf.setImage(with: URL(string: postImageUrl))
        
// Прописываю констрейнты у UIImageView кодом
        
    }
    
}

