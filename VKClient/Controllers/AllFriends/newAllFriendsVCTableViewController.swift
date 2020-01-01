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


    var token: NotificationToken?

    private lazy var users = try? Realm().objects(User.self).sorted(byKeyPath: "id")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
        let realm = try! Realm()
        let users = realm.objects(User.self)
        self.token = users.observe { change in
            switch change {
                case .initial(let result):
                    self.tableView.reloadData()
//                    print(result)
                case let .update(results, indexesDelete, indexesInsert, Indexesmodifications):
                    self.tableView.beginUpdates()
                        self.tableView.insertRows(at: indexesInsert.map{IndexPath(row: $0, section: 0)}, with: .none)
                        self.tableView.deleteRows(at: indexesDelete.map{IndexPath(row: $0, section: 0)}, with: .none)
                        self.tableView.reloadRows(at: Indexesmodifications.map{IndexPath(row: $0, section: 0)}, with: .none)
                    self.tableView.endUpdates()
                case .error:
                    print("error")
                           }
               
                   }
        }
        NetworkService.loadFriends { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                DataBase.save(items: users)
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
        
    }

       // MARK: - Table view data source
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

       return users?.count ?? 0
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "AllFriendCell", for: indexPath) as! AllFriendCell
        guard let user = users?[indexPath.row] else {return cell}
         cell.configure(with: user)

         return cell
     }

    
}
