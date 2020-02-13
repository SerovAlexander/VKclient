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


struct Friend {
    let friendName: String
    let friendAvatar: UIImage?
}


let Stive = Friend(friendName: "Стив Джобс", friendAvatar: UIImage(named: "Stive"))
let David = Friend(friendName: "Дэвид Бэкхем", friendAvatar: UIImage(named: "David"))
let Dzuba = Friend(friendName: "Артем Дзюба", friendAvatar: UIImage(named: "Dzuba"))
let Tim = Friend(friendName: "Тим Кук", friendAvatar: UIImage(named: "Tim"))
let Semak = Friend(friendName: "Сергей Семак", friendAvatar: UIImage(named: "semak"))
let Kokorin = Friend(friendName: "Александр Кокорин", friendAvatar: UIImage(named: "Kokorin"))
let Zhirkov = Friend(friendName: "Юрий Жирков", friendAvatar: UIImage(named: "Zhirkov"))
let Kuzaev = Friend(friendName: "Далер Кузяев", friendAvatar: UIImage(named: "Kuzaev"))

var friends: [Friend] = [Stive, David, Dzuba, Tim, Semak, Kokorin, Zhirkov, Kuzaev]



class User: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var secondName: String = ""
    @objc dynamic var avatar: String = ""


    
     convenience init(_ json: JSON) {
        self.init()
        
        self.id = json["id"].intValue
        self.firstName = json["first_name"].stringValue
        self.secondName = json["last_name"].stringValue
        self.avatar = json["photo_100"].stringValue
    }
    override static func primaryKey() -> String? {
        "id"
    }
}
