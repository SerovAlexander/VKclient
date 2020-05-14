//
//  AccountVC.swift
//  VKClient
//
//  Created by Aleksandr Serov on 05.04.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var accPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoCollection: UICollectionView!
    @IBOutlet weak var homeTownLabel: UILabel!

    var profile = Account()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.getProfileInfo {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let accInfo):
                self.profile = accInfo
                DispatchQueue.main.sync {
                    self.photoCollection.reloadData()
                }
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}

extension AccountVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountCell", for: indexPath) as! AccountCell
        return cell
    }
    
    
}

