//
//  FriendXIBCell.swift
//  VKClient
//
//  Created by Aleksandr Serov on 29/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class FriendXIBCell: UICollectionViewCell {

   @IBOutlet weak var friendAvatar: UIImageView!
   @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!

    var likeCount = 0
    
    
    public var heartFilled = false {
        didSet {
            if heartFilled {
                if likeCount != 0 {
                likeCount -= 1
                } else {}
                likeCountLabel.text = String(likeCount)
                heartImageView.image = UIImage(named: "EmptyHeart")
                
            } else {
                likeCount += 1
                heartImageView.image = UIImage(named: "FullHeart")
                likeCountLabel.text = String(likeCount)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
         likeCountLabel.text = "0"
        heartImageView.image = UIImage(named: "EmptyHeart")
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(heartTapped))
        heartImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func heartTapped() {
        heartFilled.toggle()
    }
    
// Метод, чтобы ячейки при переиспользовании всегда появлялись с без лайка
    override func prepareForReuse() {
        super.prepareForReuse()
        
        heartImageView.image = UIImage(named: "EmptyHeart")
    }
}
