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
    
  @objc dynamic var id: Int = 0
  var sizes = List<Size>()
    
    convenience init(_ json: JSON) {
        self.init()
        
        self.id = json["id"].intValue
        let sizesArr = json["sizes"].map {Size($1)}
        self.sizes.append(objectsIn: sizesArr)
        
    }
    override static func primaryKey() -> String? {
        "id"
    }
}

class Size: Object {
    
    @objc dynamic var url: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var height: Int = 0
    @objc dynamic var width: Int = 0
    
    convenience init(_ json: JSON) {
    self.init()
    
    self.url = json["url"].stringValue
    self.type = json["type"].stringValue
    self.height = json["height"].intValue
    self.width = json["width"].intValue
    
    }
}
