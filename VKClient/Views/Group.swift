//
//  Group.swift
//  VKClient
//
//  Created by Aleksandr Serov on 19/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

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



struct Groupss: Codable {
    let response: Response
}

struct Response: Codable {
    let item: Item
}

struct Item: Codable {
    let id: Int
    let name: String
    let photo100: String

    enum GroupKeys: String, CodingKey {
        case id
        case nameGroup = "name"
        case imageGroup = "photo100"

    }

}
