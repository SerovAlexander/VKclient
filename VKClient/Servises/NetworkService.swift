//
//  NetworkServises.swift
//  VKClient
//
//  Created by Aleksandr Serov on 28/09/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    static let sessionRequest: SessionManager = {
        let config = URLSessionConfiguration.default
        let session = SessionManager(configuration: config)
        return session
    }()
    
// Функция для получения групп пользователя
    static func getGroup(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
          "access_token":session.shared.token,
          "extended": 1,
          "v": "5.92"
        ]
        
        NetworkService.sessionRequest.request(baseUrl + path, method: .get, parameters: params).responseJSON {response in
            guard let json = response.value else {return}
            
            print(json)
        }
    }
    
// Функция для получения списка друзей пользователя
    static func loadFriends(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": session.shared.token,
            "fields":"nickname",
            "v": "5.8"
        ]
        
        NetworkService.sessionRequest.request(baseUrl + path, method: .get, parameters: params).responseJSON {response in
        guard let json = response.value else {return}
        
        print(json)
       
        }
        
    }
    
// Функция для получения фотографий пользователя
    
    static func getPhotos(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token": session.shared.token,
            "no_service_albums": "1",
            "v": "5.77"
        ]
        
        NetworkService.sessionRequest.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else {return}
            
            print(json)
         }
    }
    
}
   

