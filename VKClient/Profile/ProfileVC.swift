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
import RealmSwift

class ProfileVC: UIViewController {
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var userPhoto: UIImageView?
    @IBOutlet var nameLanel: UILabel?
    
    private lazy var photos =  try? Realm().objects(UserPhoto.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let userPhotos = realm.objects(UserPhoto.self)
        
        DispatchQueue.global().async {
            NetworkService.getPhotos{[weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let userPhotos):
                    DataBase.save(items: userPhotos)
                case .failure(let error):
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

extension ProfileVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as! PhotosCell
        guard let userPhotos = photos?[indexPath.row] else { return cell }
       
        cell.configure(with: userPhotos)
    
        return cell
    }
    
    
}
