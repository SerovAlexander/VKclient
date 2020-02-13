//
//  AllFriendCell.swift
//  VKClient
//
//  Created by mac on 16/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Kingfisher

class AllFriendCell: UITableViewCell {
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var avatarShadowView: AvatarShadowView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    public func configure(with user: User) {
        friendName.text = user.firstName + " " + user.secondName
        let url = URL(string: user.avatar)
        avatarShadowView.friendAvatar.kf.setImage(with: url)
    }
}
