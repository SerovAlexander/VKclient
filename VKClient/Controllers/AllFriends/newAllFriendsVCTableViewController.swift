//
//  newAllFriendsVCTableViewController.swift
//  VKClient
//
//  Created by Aleksandr Serov on 05/10/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class newAllFriendsVCTableViewController: UITableViewController {

    var users = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkService.loadFriends { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.users = users
                self.tableView.reloadData()
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
    }

       // MARK: - Table view data source
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
        return users.count
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "AllFriendCell", for: indexPath) as! AllFriendCell
         let user = users[indexPath.row]
         cell.configure(with: user)

         return cell
     }

    
}
