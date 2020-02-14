//
//  UserPhoto.swift
//  VKClient
//
//  Created by Aleksandr Serov on 13.02.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

class UserPhoto: Object {
    
  @objc dynamic var userPhotos: String = ""
  @objc dynamic var type: String = ""
  @objc dynamic var id: Int = 0
    
    
    convenience init(_ json: JSON) {
        self.init()
        
        self.userPhotos = json["sizes"][0]["url"].stringValue
        self.type = json["sizes"][0]["type"].stringValue
        self.id = json["id"].intValue
        
    }
    override static func primaryKey() -> String? {
        "id"
    }
}
