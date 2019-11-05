//
//  NewMyGroupVC.swift
//  VKClient
//
//  Created by Aleksandr Serov on 04.11.2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class NewMyGroupVC: UITableViewController {
    
    
    var newGroup = [Items]()

    override func viewDidLoad() {
        super.viewDidLoad()
//Вопросы!!!
       NetworkService.getGroup { [weak self] result in
           guard let self = self else { return }
           switch result {
           case .success(let groups):
               self.newGroup = groups
               self.tableView.reloadData()
           case .failure(let error):
               fatalError(error.localizedDescription)
           }
       }
    }

    
       // MARK: - Table view data source
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
        return newGroup.count
     }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as! MyGroupCell
        let group = newGroup[indexPath.row]
         cell.configure(with: group)

         return cell
     }



   

}
