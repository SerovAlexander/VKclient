//
//  AllFriendCell.swift
//  VKClient
//
//  Created by mac on 16/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AllFriendCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var AvatarShadowView: AvatarShadowView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
