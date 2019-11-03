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



//struct Groupss: Codable {
//    let response: Response
//}
//
//struct Response: Codable {
//    let item: Item
//}
//
//struct Item: Codable {
//    let id: Int
//    let name: String
//    let photo100: String
//
//    enum GroupKeys: String, CodingKey {
//        case id
//        case nameGroup = "name"
//        case imageGroup = "photo100"
//
//    }
//
//}
//
class Groupss: Codable {
    let response: Response
}

class Response: Codable {
    let items: [Items]
}
class Items: Codable {
    let id: Int
    let name: String
    let photo_100: String
    
}

//{
//"response": {
//    "count": 165,
//    "items": [
//        {
//            "id": 44982161,
//            "name": "ЖК \"Гринландия\" | Setl City",
//            "screen_name": "greenlandia",
//            "is_closed": 1,
//            "type": "group",
//            "is_admin": 0,
//            "is_member": 1,
//            "is_advertiser": 0,
//            "photo_50": "https://sun3-10.userapi.com/4H1oAa8l0VwMaT_neqpwmTWYg3oL3_LA6zrm_g/btm_4_Hy6jo.jpg?ava=1",
//            "photo_100": "https://sun3-12.userapi.com/elS8QgzO8E6YEarqMlkOJ1XkAFDPArfjuVWD5Q/bMpbGpq7oBg.jpg?ava=1",
//            "photo_200": "https://sun3-11.userapi.com/THv98EVo-P30zGt2fTXSBU1bvyy_xdI2G4oQzQ/m6Th6-A_FOc.jpg?ava=1"
//        },
