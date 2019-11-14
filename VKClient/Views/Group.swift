//
//  Group.swift
//  VKClient
//
//  Created by Aleksandr Serov on 19/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RealmSwift

struct Group {
    var nameGroup: String
    var imageGroup: UIImage?
}


let Music = Group(nameGroup: "Музыка", imageGroup: UIImage(named: "Music"))
let Books = Group(nameGroup: "Книги", imageGroup: UIImage(named: "Books"))
let Swift = Group(nameGroup: "Swift", imageGroup: UIImage(named: "Swift"))
let Girls = Group(nameGroup: "Девушки", imageGroup: UIImage(named: "Girls"))
let Cinema = Group(nameGroup: "Кино", imageGroup: UIImage(named: "Cinema"))

var Groups: [Group] = [Music,Books,Swift,Girls,Cinema]




class Groupss: Codable {
     let response: Response
}

class Response: Codable {
    let items: [Items]
}
class Items: Object, Codable {
    @objc dynamic let id = 0
    let name = ""
    let photo_100: URL?
    
}

