//
//  ProfileVC.swift
//  VKClient
//
//  Created by Aleksandr Serov on 13.02.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ProfileVC: UIViewController {
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var userPhoto: UIImageView?
    @IBOutlet var nameLanel: UILabel?
    
    var photosss = [UserPhoto]()
    
    
    
    var userId: Int?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Делаю запрос на получение фотографий профиля
        
        NetworkService.getPhotos(id: userId){[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let userPhotos):
                self.photosss = userPhotos
                DispatchQueue.main.sync {
                    self.photosCollectionView.reloadData()
                }
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}

extension ProfileVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosss.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as! PhotosCell
        
        let userPhotos = photosss[indexPath.row].sizes
        
        var photoSize: Size = userPhotos[0]
        for size in userPhotos {
            if size.type == "y" {
                photoSize = size
                break
            }
        }
        
        cell.configure(with: photoSize)
        
        return cell
    }
}
