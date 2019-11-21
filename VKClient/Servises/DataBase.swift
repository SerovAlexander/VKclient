//
//  DataBase.swift
//  VKClient
//
//  Created by Aleksandr Serov on 20.11.2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import RealmSwift

class DataBase {
// Функция для сохранения списка друзей из ВК в базу данных Realm
    static func save<T: Object>(items: [T]) {
        
    let realm = try! Realm()
        print(realm.configuration.fileURL)
    try? realm.write {
        realm.add(items)
    
        }
    }
// Функция для очистки базы данных
    static func clearDataBase() {
        
       let realm = try! Realm()
        
        try? realm.write {
            realm.deleteAll()
        }
    }
}
