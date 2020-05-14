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
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var token: NotificationToken?
    private var photoService: PhotoService?
    
    private lazy var newGroup = try? Realm().objects(Items.self)
    
    var filteredGroups = [Items]()
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredGroups = Array(newGroup!)
        searchBar.delegate = self
        
            let realm = try! Realm()
            let newGroup = realm.objects(Items.self)
            self.token = newGroup.observe { change in
                switch change {
                case .initial(let result):
                    self.tableView.reloadData()
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
//Делаю запрос на получения списка групп
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
       
        return filteredGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as! MyGroupCell
        let group = filteredGroups[indexPath.row]
        cell.configure(with: group)
        
        return cell
    }
    
    
    
    
    
}

extension NewMyGroupVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        guard let newGroup = newGroup else { return }
        
        if searchText.isEmpty == false{
            filteredGroups = Array((newGroup.filter({$0.name.lowercased().contains(searchText.lowercased())})))
        } else {
            filteredGroups = Array(newGroup)
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
}
