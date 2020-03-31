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
    static func getGroup(comletion: @escaping (Result<[Items]>) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token":Session.shared.token,
            "extended": 1,
            "v": "5.92"
        ]
        
        NetworkService.sessionRequest.request(baseUrl + path, method: .get, parameters: params).responseData {response in
            DispatchQueue.global().async {
// Блок кода парсинга списка групп асинхронно на глобальной очереди
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let groups = try decoder.decode(Groupss.self, from: data)
                        comletion(.success(groups.response.items))
                    } catch {
                        print("\(error) Vot tut oshibka")
                    }
                    
                case .failure(let error):
                    print("Tozhe Oshibka")
                }
            }
        }
    }
    
    // Функция для получения списка друзей пользователя
    static func loadFriends(completion: @escaping (Result<[User]>) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        let params: Parameters = [
            "access_token": Session.shared.token,
            "fields":["nickname","photo_100"],
            "v": "5.8"
        ]
        
        NetworkService.sessionRequest.request(baseUrl + path, method: .get, parameters: params).responseJSON {response in
// Блок кода парсинга списка друзей асинхронно на глобальной очереди
            DispatchQueue.global().async {
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
    }
    
    // Функция для получения фотографий пользователя
    
    static func getPhotos(id: Int?, completion: @escaping (Result<[UserPhoto]>) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.getAll"
        
        var params: Parameters = [
            "access_token": Session.shared.token,
            "no_service_albums": "0",
            "v": "5.77"
        ]
        
        guard let id = id else { return }
        params["owner_id"] = String(id)
          
        
        NetworkService.sessionRequest.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            DispatchQueue.global().async {
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
//                    print(json)
                    let newJSON = json["response"]["items"].arrayValue
                    let userPhotos = newJSON.map {UserPhoto($0)}
                    completion(.success(userPhotos))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
// Функция для получения новостей пользователя
    
    static func getNews(comletion: @escaping (Result<[News]>) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/newsfeed.get"
        let params: Parameters = [
            "access_token": Session.shared.token,
            "filters":"Post",
            "max_photos": "10",
            "count":"20",
            "v": "5.103"
        ]
        
        NetworkService.sessionRequest.request(baseUrl + path, method: .get, parameters: params).responseJSON {response in
            // Блок кода парсинга новостей асинхронно на глобальной очереди
            DispatchQueue.global().async {
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    let newJSON = json["response"]["items"].arrayValue
                    let news = newJSON.map {News($0)}
                    comletion(.success(news))
                case .failure(let error):
                    comletion(.failure(error))
                }
            }
        }
    }
}

