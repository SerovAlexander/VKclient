//
//  User.swift
//  VKClient
//
//  Created by Aleksandr Serov on 20/08/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

struct friend {
    let friendName: String
    let friendAvatar: UIImage?
}


let Stive = friend(friendName: "Стив Джобс", friendAvatar: UIImage(named: "Stive"))
let David = friend(friendName: "Дэвид Бэкхем", friendAvatar: UIImage(named: "David"))
let Dzuba = friend(friendName: "Артем Дзюба", friendAvatar: UIImage(named: "Dzuba"))
let Tim = friend(friendName: "Тим Кук", friendAvatar: UIImage(named: "Tim"))
let Semak = friend(friendName: "Сергей Семак", friendAvatar: UIImage(named: "semak"))
let Kokorin = friend(friendName: "Александр Кокорин", friendAvatar: UIImage(named: "Kokorin"))
let Zhirkov = friend(friendName: "Юрий Жирков", friendAvatar: UIImage(named: "Zhirkov"))
let Kuzaev = friend(friendName: "Далер Кузяев", friendAvatar: UIImage(named: "Kuzaev"))
//let Semak = friend(friendName: "Сергей Семак", friendAvatar: UIImage(named: "semak"))

var friends: [friend] = [Stive, David, Dzuba, Tim, Semak, Kokorin, Zhirkov, Kuzaev]





