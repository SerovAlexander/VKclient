//
//  User.swift
//  VKClient
//
//  Created by Aleksandr Serov on 20/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift


struct friend {
    let friendName: String
    let friendAvatar: UIImage?
}


let Stive = friend(friendName: "Стив Джобс", friendAvatar: UIImage(named: "Stive"))
let David = friend(friendName: "Дэвид Бэкхем", friendAvatar: UIImage(named: "David"))
let Dzuba = friend(friendName: "Артем Дзюба", friendAvatar: UIImage(named: "Dzuba"))
let Tim = friend(friendName: "Тим Кук", friendAvatar: UIImage(named: "Tim"))
let Semak = friend(friendName: "Сергей Семак", friendAvatar: UIImage(named: "semak"))
let Kokorin = friend(friendName: "Александр Кокорин", friendAvatar: UIImage(named: "Kokorin"))
let Zhirkov = friend(friendName: "Юрий Жирков", friendAvatar: UIImage(named: "Zhirkov"))
let Kuzaev = friend(friendName: "Далер Кузяев", friendAvatar: UIImage(named: "Kuzaev"))

var friends: [friend] = [Stive, David, Dzuba, Tim, Semak, Kokorin, Zhirkov, Kuzaev]



class User: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var secondName: String = ""
    @objc dynamic var avatar: String = ""

    
     convenience init(_ json: JSON) {
        self.init()
        
        self.id = json["id"].stringValue
        self.firstName = json["first_name"].stringValue
        self.secondName = json["last_name"].stringValue
        self.avatar = json["photo_100"].stringValue
    }
    override static func primaryKey() -> String? {
        "id"
    }
}
