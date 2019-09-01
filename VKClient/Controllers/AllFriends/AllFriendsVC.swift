//
//  AllFriendsVC.swift
//  VKClient
//
//  Created by mac on 16/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AllFriendsVC: UITableViewController {

    var firstCharactes = [Character]()
    var sortedFriends: [Character: [friend]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         (firstCharactes, sortedFriends) = sortFriendsByCharacters(friends)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return firstCharactes.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let character = firstCharactes[section]
        let friendsCount = sortedFriends[character]?.count
        return friendsCount ?? 0

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllFriendCell") as! AllFriendCell
        
        let character = firstCharactes[indexPath.section]
        
        if let friends = sortedFriends[character] {
        
        let friend = friends[indexPath.row]
        cell.friendName.text = friend.friendName
        cell.avatarShadowView.friendAvatar.image = friend.friendAvatar
            
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let friend = friends[indexPath.row]
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"FriendVC") as! FriendVC
        
        vc.friend = friend
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
    private func sortFriendsByCharacters(_ friends:[friend]) -> (characters: [Character], sortedFriends: [Character: [friend]]) {
        
        var characters = [Character]()
        var sortedFriends = [Character: [friend]]()
        
        
        friends.forEach { friend in
            guard let character = friend.friendName.first else {return}
            if var thisCharFriends = sortedFriends[character] {
                thisCharFriends.append(friend)
                sortedFriends[character] = thisCharFriends
            } else {
                sortedFriends[character] = [friend]
                characters.append(character )
            }
        }
        characters.sort()
        return (characters, sortedFriends)
    }
}
