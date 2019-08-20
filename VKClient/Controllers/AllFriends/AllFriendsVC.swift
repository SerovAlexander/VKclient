//
//  AllFriendsVC.swift
//  VKClient
//
//  Created by mac on 16/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AllFriendsVC: UITableViewController {


//    var friends: [String] = [
//        "Иван Иванов",
//        "Александр Серов",
//        "Стив Джобс",
//        "Тим Кук"
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Friends.count 

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllFriendCell") as! AllFriendCell

        let friend = Friends[indexPath.row]
        cell.friendName.text = friend.friendName
        cell.friendAvatar.image = friend.friendAvatar
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let friend = Friends[indexPath.row]
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"FriendVC") as! FriendVC
        
        vc.friend = friend
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
