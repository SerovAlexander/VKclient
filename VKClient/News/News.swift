//
//  News.swift
//  VKClient
//
//  Created by Aleksandr Serov on 04/09/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

struct news {
    let avatarImage: UIImage?
    let nameLabel: String
    let dataLabel: String
    let textField: String?
    let image: UIImage?
}

let news1 = news(avatarImage: UIImage(named: "semak"), nameLabel: "Сергей Семак", dataLabel: "04.09.2019", textField: "Изучаю Xcode, пока тяжеловато! Но очень надеюсь, что в скором будущем, буду разбираться лучше!", image: UIImage(named: "xcode"))

let news2 = news(avatarImage: UIImage(named: "Dzuba"), nameLabel: "Артем Дзюба", dataLabel: "03.09.2019", textField: "Какая красивая девушка!", image: UIImage(named: "Girls"))
