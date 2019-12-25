//
//  NewMyGroupVC.swift
//  VKClient
//
//  Created by Aleksandr Serov on 04.11.2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RealmSwift

class NewMyGroupVC: UITableViewController {
    
    
    var token: NotificationToken?

    private lazy var newGroup = try? Realm().objects(Items.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
        let realm = try! Realm()
        let newGroup = realm.objects(Items.self)
        self.token = newGroup.observe { change in
        switch change {
            case .initial(let result):
                self.tableView.reloadData()
                print(result)
            case let .update(results, indexesDelete, indexesInsert, Indexesmodifications):
                self.tableView.beginUpdates()
                    self.tableView.insertRows(at: indexesInsert.map{IndexPath(row: $0, section: 0)}, with: .none)
                    self.tableView.deleteRows(at: indexesDelete.map{IndexPath(row: $0, section: 0)}, with: .none)
                    self.tableView.reloadRows(at: Indexesmodifications.map{IndexPath(row: $0, section: 0)}, with: .none)
                self.tableView.endUpdates()
//            print(indexesDelete)
//            print(indexesInsert)
//            print(Indexesmodifications)
            case .error:
                print("error")
                        }
                    }
               }

       NetworkService.getGroup { [weak self] result in
           guard let self = self else { return }
           switch result {
           case .success(let groups):
            DataBase.save(items: groups)
           case .failure(let error):
               fatalError(error.localizedDescription)
           }
       }
    }

    
       // MARK: - Table view data source
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
        return newGroup?.count ?? 0
     }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as! MyGroupCell
        guard let group = newGroup?[indexPath.row] else {return cell}
         cell.configure(with: group)

         return cell
     }



   

}
