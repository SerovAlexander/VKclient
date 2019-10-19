//
//  AvatarShadowView.swift
//  VKClient
//
//  Created by Aleksandr Serov on 28/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Kingfisher
class AvatarShadowView: UIView {


    @IBOutlet weak var shadow: UIView!
    @IBOutlet weak var friendAvatar: UIImageView!
   
    
    @IBInspectable var shadowRadius: CGFloat = 8 {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var shadowColor: UIColor = .black {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet { setNeedsDisplay() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadow.clipsToBounds = false
        shadow.backgroundColor = .white
        shadow.layer.shadowColor = shadowColor.cgColor
        shadow.layer.shadowOpacity = shadowOpacity
        shadow.layer.shadowOffset = .zero
        shadow.layer.shadowRadius = shadowRadius
        
        friendAvatar.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadow.layer.cornerRadius = bounds.width/2
        friendAvatar.layer.cornerRadius = bounds.width/2
    }

}
