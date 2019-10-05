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
        
//        if let url = friend.avatarUrl {
//            NetworkService.fetchImage(by: url) { [weak self] result in
//                switch result {
//                case .success(let image):
//                    self?.avatar.image = image
//                case .failure:
//                    break
//                }
//            }
//        }
    }
}
