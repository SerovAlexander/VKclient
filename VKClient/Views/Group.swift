//
//  Group.swift
//  VKClient
//
//  Created by Aleksandr Serov on 19/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RealmSwift

class Groupss: Codable {
    let response: Response
}

class Response: Codable {
    let items: [Items]
}
class Items: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photo_100: String = ""
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

