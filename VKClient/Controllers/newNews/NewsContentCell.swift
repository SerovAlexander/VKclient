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
    
    
    @IBOutlet weak var newsContentView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    public func configure(with news: News?) {
        
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
            postImageUrl = news?.postPhoto ?? ""
            
        } else {
            sourceId = -sourceId
            if news == nil {
                return
            }
            guard let sourceDB = try? Realm().objects(Items.self).filter("id == %@", sourceId),
                let group = sourceDB.first
                else {return}
            postImageUrl = news?.postPhoto ?? ""
        }
        
        newsContentView?.kf.setImage(with: URL(string: postImageUrl))
        
        
    }
    
}

