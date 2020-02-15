//
//  PhotosCell.swift
//  VKClient
//
//  Created by Aleksandr Serov on 14.02.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    @IBOutlet var userPhotos: UIImageView!
    
    
    public func configure(with userPhoto: Size) {
        let url = URL(string: userPhoto.url)
        userPhotos.kf.setImage(with: url)
    }
}
