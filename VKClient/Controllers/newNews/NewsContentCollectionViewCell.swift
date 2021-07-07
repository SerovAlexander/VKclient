//
//  NewsContentCollectionViewCell.swift
//  VKClient
//
//  Created by Aleksandr Serov on 09.03.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher

class NewsContentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newImage: UIImageView!
    
    
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
                postImageUrl = news?.postPhoto.first?.sizes.first?.url ?? ""
    
            } else {
                sourceId = -sourceId
                if news == nil {
                    return
                }
                guard let sourceDB = try? Realm().objects(Items.self).filter("id == %@", sourceId),
                    let group = sourceDB.first
                    else {return}
                postImageUrl = news?.postPhoto.first?.sizes.first?.url ?? ""
            }
    
            newImage?.kf.setImage(with: URL(string: postImageUrl))
    
    
        }
    
}
