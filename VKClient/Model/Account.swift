//
//  Account.swift
//  VKClient
//
//  Created by Aleksandr Serov on 03.04.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftyJSON

class Account {
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    
    convenience init(_ json: JSON) {
        self.init()
        
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
    }
}
