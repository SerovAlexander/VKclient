//
//  NetworkServises.swift
//  VKClient
//
//  Created by Aleksandr Serov on 28/09/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
    static func loadFriends(completion: @escaping (Result<[User]>) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": session.shared.token,
            "fields":["nickname","photo_100"],
            "v": "5.8"
        ]
        
        NetworkService.sessionRequest.request(baseUrl + path, method: .get, parameters: params).responseJSON {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let userJSONs = json["response"]["items"].arrayValue
                let users = userJSONs.map { User($0) }
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
            
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
   

