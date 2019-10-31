//
//  AllGroupVC.swift
//  VKClient
//
//  Created by mac on 17/08/2019.
//  Copyright © 2019 mac. All rights reserved.


import UIKit

protocol AllGroupDelegate {
    func vc(_ vc: AllGroupVC, didSelectGroup group: Group)
    }


class AllGroupVC: UITableViewController {

    @IBOutlet weak var GroupImage: UIImageView!


    var delegate: AllGroupDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()



    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell") as! MyGroupCell

        let group = Groups[indexPath.row]
        cell.GroupName.text = group.nameGroup
        cell.GroupImage.image = group.imageGroup
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = Groups[indexPath.row]
        delegate?.vc(self, didSelectGroup: group)
        self.navigationController?.popViewController(animated: true)
    }

}
