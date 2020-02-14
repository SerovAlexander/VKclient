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
    
    
    public func configure(with userPhoto: UserPhoto) {
        let url = URL(string: userPhoto.userPhotos)
        userPhotos.kf.setImage(with: url)
    }
}
