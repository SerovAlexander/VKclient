//
//  FriendVC.swift
//  VKClient
//
//  Created by mac on 17/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit



class FriendVC: UICollectionViewController {
    
    var friend: friend?

    override func viewDidLoad() {
        super.viewDidLoad()

// Регистрирую ячейку созданную в XIB Файле
        
        let friendXibCellNib = UINib(nibName: "FriendXIBCell", bundle: nil)
        collectionView.register(friendXibCellNib, forCellWithReuseIdentifier: "FriendXIBCell")
    }

  
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendXIBCell", for: indexPath) as! FriendXIBCell
        let friend = friends[indexPath.row]
        cell.avatar.image = friend.friendAvatar
        return cell
    
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as! FriendCell
       
    }

    

}
