//
//  ButtonLike.swift
//  VKClient
//
//  Created by Aleksandr Serov on 01.03.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ButtonLike: UIButton {
    var liked: Bool = false {
        didSet {
            if liked {
                setLike()
            } else {
                dislike()
            }
        }
    }
    
    private var likeCount = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefault()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupDefault() {
        
    }
    
    private func setLike() {
        likeCount += 1
        setImage(UIImage(named: "FullHeart"), for: .normal)
        setTitle(String(describing: likeCount), for: .normal)
        tintColor = .red
    }
    
    private func dislike() {
        likeCount -= 1
        setImage(UIImage(named: "EmptyHeart"), for: .normal)
        setTitle(String(describing: likeCount), for: .normal)
        tintColor = .none
    }
}
