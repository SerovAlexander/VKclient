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
