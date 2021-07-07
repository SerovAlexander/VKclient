//
//  NewsTopXIBCell.swift
//  VKClient
//
//  Created by Aleksandr Serov on 24.02.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher

class NewsTopXIBCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImage.layer.cornerRadius  = 27
    }
    
    public func configure(with news: News?, dateString: String) {
        
        guard var sourceId = news?.sourceId else { return }
        var postAutor: String = ""
        var avatarURL: String = ""
        guard sourceId != 0 else { return }
        if sourceId > 0 {
            if news == nil {
                return
            }
            guard let sourceDB = try? Realm().objects(User.self).filter("id == %@", sourceId),
                let user = sourceDB.first
                else { return }
            postAutor = user.firstName + " " + user.secondName
            avatarURL = user.avatar
            
        } else {
            sourceId = -sourceId
            if news == nil {
                return
            }
            guard let sourceDB = try? Realm().objects(Items.self).filter("id == %@", sourceId),
                let group = sourceDB.first
                else {return}
            postAutor = group.name
            avatarURL = group.photo_100
        }
        avatarImage.kf.setImage(with: URL(string: avatarURL))
        nameLabel.text = postAutor
        dataLabel.text = dateString
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
