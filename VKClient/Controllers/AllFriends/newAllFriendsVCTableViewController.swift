//
//  newAllFriendsVCTableViewController.swift
//  VKClient
//
//  Created by Aleksandr Serov on 05/10/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RealmSwift

class newAllFriendsVCTableViewController: UITableViewController {

    var users = [User]()
    var token: NotificationToken?

//    private lazy var users = try? Realm().objects(User.self).sorted(byKeyPath: "id")
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        NetworkService.loadFriends { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                DataBase.save(items: users)
                self.users = users
                self.tableView.reloadData()
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        let realm = try! Realm()
            let users = realm.objects(User.self)
            self.token = users.observe { change in
                switch change {
                    case .initial(let result):
                        print(result)
                    case let .update(results, indexesDelete, indexesInsert, Indexesmodifications):
//                        print(results)
                        print(indexesDelete)
                        print(indexesInsert)
                        print(Indexesmodifications)
                    case .error: print("error")
                                        
                    }
        
            }
    }

       // MARK: - Table view data source
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
        return users.count
//        return users?.count ?? 0
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "AllFriendCell", for: indexPath) as! AllFriendCell
        let user = users[indexPath.row]
//        guard let user = users?[indexPath.row] else {return cell}
         cell.configure(with: user)

         return cell
     }

    
}
