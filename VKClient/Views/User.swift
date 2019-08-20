//
//  User.swift
//  VKClient
//
//  Created by Aleksandr Serov on 20/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

struct Friend {
    let friendName: String
    let friendAvatar: UIImage?
}


let Stive = Friend(friendName: "Стив Джобс", friendAvatar: UIImage(named: "Stive"))
let David = Friend(friendName: "Дэвид Бэкхем", friendAvatar: UIImage(named: "David"))
let Dzuba = Friend(friendName: "Артем Дзюба", friendAvatar: UIImage(named: "Dzuba"))
let Tim = Friend(friendName: "Тим Кук", friendAvatar: UIImage(named: "Tim"))
let Semak = Friend(friendName: "Сергей Семак", friendAvatar: UIImage(named: "semak"))

var Friends: [Friend] = [Stive, David, Dzuba, Tim, Semak]
