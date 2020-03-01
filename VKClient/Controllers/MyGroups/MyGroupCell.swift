//
//  MyGroupCell.swift
//  VKClient
//
//  Created by mac on 17/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Kingfisher

class MyGroupCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    
    override func awakeFromNib() {
       super.awakeFromNib()
   
    }
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func configure(with group: Items) {
        groupName.text = group.name
        
                let url = URL(string: group.photo_100)
                groupImage.kf.setImage(with: url)
        
        
    }
}

