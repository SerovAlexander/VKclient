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
    @objc dynamic var date: Double = 0
    
    
    convenience init(_ json: JSON) {
        self.init()
        
        self.sourceId = json["sourse_id"].intValue
        self.newsText = json["text"].stringValue
        self.date = json["date"].doubleValue
    }
    override static func primaryKey() -> String? {
        "sourceId"
    }
}













struct oldNews {
    let avatarImage: UIImage?
    let nameLabel: String
    let dataLabel: String
    let textField: String?
    let image: UIImage?
}

let news1 = oldNews(avatarImage: UIImage(named: "semak"), nameLabel: "Сергей Семак", dataLabel: "04.09.2019", textField: "Изучаю Xcode, пока тяжеловато! Но очень надеюсь, что в скором будущем, буду разбираться лучше!", image: UIImage(named: "xcode"))

let news2 = oldNews(avatarImage: UIImage(named: "Dzuba"), nameLabel: "Артем Дзюба", dataLabel: "03.09.2019", textField: "Какая красивая девушка!", image: UIImage(named: "Girls"))


