
//  AllFriendsVC.swift
//  VKClient
//
//  Created by mac on 16/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class MyGroupVC: UITableViewController {
    

    @IBAction func searchGroupButton(_ sender: Any) {
        performSegue(withIdentifier: "ToSelect", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AllGroupVC
        vc.delegate = self
        
    }
    
    var userGroups: [Group] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userGroups.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell") as! MyGroupCell
        
        let group = userGroups[indexPath.row]
        cell.GroupName.text = group.nameGroup
        cell.GroupImage.image = group.imageGroup
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}

extension MyGroupVC: AllGroupDelegate {
    func vc(_ vc: AllGroupVC, didSelectGroup group: Group) {
//        if userGroups.contains(group) {
            userGroups.append(group)
//        }
        tableView.reloadData()
    }
}
