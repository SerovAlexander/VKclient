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

    @IBOutlet weak var GroupName: UILabel!
    @IBOutlet weak var GroupImage: UIImageView!
    
    override func awakeFromNib() {
       super.awakeFromNib()
        GroupImage.layer.masksToBounds = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        GroupImage.layer.cornerRadius  = 45
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func configure(with group: Items) {
        GroupName.text = group.name
        let url = URL(string: group.photo_100)
        GroupImage.kf.setImage(with: url)

       }
}
