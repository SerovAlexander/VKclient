//
//  News.swift
//  VKClient
//
//  Created by Aleksandr Serov on 04/09/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import SwiftyJSON

class News: Object {
    @objc dynamic var sourceId: Int = 0
    @objc dynamic var newsText: String = ""
    @objc dynamic var date: Date = Date.distantPast
    @objc dynamic var post_id: Int = 0
    var postPhoto = List<Photo>()

    @objc dynamic var commentsCount: Int = 0
    @objc dynamic var likesCount: Int = 0
    @objc dynamic var userLike: Int = 0
    
    convenience init(_ json: JSON) {
        self.init()
        
        self.sourceId = json["source_id"].intValue
        self.newsText = json["text"].stringValue
        let date = json["date"].doubleValue
        self.date = Date(timeIntervalSince1970: date)
        self.post_id = json["post_id"].intValue
        self.postPhoto.append(objectsIn: json["attachments"].map{Photo($1["photo"])})
        self.commentsCount = json["comments"]["count"].intValue
        self.likesCount = json["likes"]["count"].intValue
        self.userLike = json["likes"]["user_likes"].intValue
    }
    override static func primaryKey() -> String? {
        "post_id"
    }
    

    
}

class Photo: Object {
    
    var sizes = List<Size>()
    
   convenience init(_ json: JSON) {
    self.init()
        self.sizes.append(objectsIn: json["sizes"].map {Size($1)})

        
    }
}



