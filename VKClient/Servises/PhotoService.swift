//
//  PhotoService.swift
//  VKClient
//
//  Created by Aleksandr Serov on 29.01.2020.
//  Copyright © 2020 mac. All rights reserved.
//
// Класс для реализации кэширования изображений


import UIKit
import Alamofire

class PhotoService {
    private var memoryCash = [String: UIImage]()
   // константа характерезует время жизни файла в кэше
    private let cashLifeTime: TimeInterval = 60*60*24*7
    
    // создаем константу (имя папки в кэше) для хранения URL изображений
    
    private static let pathName: String = {
        let pathName = "images"
        
        guard let cacheDir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return pathName }
        let url = cacheDir.appendingPathComponent(pathName, isDirectory: true)
        
        if !FileManager.default.fileExists(atPath: url.path) {
            try? FileManager.default.createDirectory(at: url,
                                                     withIntermediateDirectories: true,
                                                     attributes: nil)
        }
        
        return pathName 
    }()
    
    // Получаем путь к файлу
    
    private func getFilePath(urlString: String) -> String? {
        guard let cacheDir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
              else { return nil }
        let hashName = String(describing: urlString.hashValue)
        
        return cacheDir.appendingPathComponent(PhotoService.pathName + "/" + hashName).path
    }
    
    //  Сохраняем изображение в кэш
    
    private func saveImageToFilesystemCash(urlString: String, image: UIImage) {
        guard let fileName = getFilePath(urlString: urlString) else { return }
        let data = image.pngData()
        FileManager.default.createFile(atPath: fileName, contents: data, attributes: nil)
    }
    
    private func getImageFromFilesystemCash(urlString: String) -> UIImage? {
        guard let fileName = getFilePath(urlString: urlString),
            let info = try? FileManager.default.attributesOfItem(atPath: fileName),
            let modificationDate = info[FileAttributeKey.modificationDate] as? Date else { return nil }
            
        let lifeTime = Date().timeIntervalSince(modificationDate)
        
        guard lifeTime <= cashLifeTime,
            let image = UIImage(contentsOfFile: fileName) else { return nil }
        
           memoryCash[urlString] = image
           return image
        }
  // Загрузка фото из интернета
    private func loadPhoto(atIndexpath indexPath: IndexPath, urlString: String) {
        Alamofire.request(urlString).responseData { [weak self] response in
            guard let self = self,
                let data = response.data,
                let image = UIImage(data: data) else {
//                    completion(nil)
                    return
            }
            self.memoryCash[urlString] = image
            self.saveImageToFilesystemCash(urlString: urlString, image: image )
//            completion(image)
            DispatchQueue.main.async { [weak self] in
//                self?.container.reloadRow(atIndexpath: indexPath)
            }
        }
    }
    
    // MARK: - публичный метод для загрузки фото из кэша с проверкой на наличие
    
    public func photo(atIndexpath indexPath: IndexPath, urlString: String) -> UIImage? {
        var groupImage: UIImage?
        
        if let image = memoryCash[urlString] {
            groupImage = image
            //completion(image)
        } else if let image = getImageFromFilesystemCash(urlString: urlString) {
            groupImage = image
//            completion(image)
        } else {
            loadPhoto(atIndexpath: indexPath, urlString: urlString)
        }
        return groupImage
    }
    
    private let container: DataReloadable

    init(container: UITableView) {
        self.container = Table(table: container)
    }

    init(container: UICollectionView) {
        self.container = Collection(collection: container)
    }
}


fileprivate protocol DataReloadable {
    func reloadRow(atIndexpath indexPath: IndexPath)
}

extension PhotoService {
private class Table: DataReloadable {
        
    let table: UITableView
        
        init(table: UITableView) {
            self.table = table
        }
        
        func reloadRow(atIndexpath indexPath: IndexPath) {
            table.reloadRows(at: [indexPath], with: .none)
        }
        
    }

private class Collection: DataReloadable {
    let collection: UICollectionView
    
    init(collection: UICollectionView) {
        self.collection = collection
    }
    
    func reloadRow(atIndexpath indexPath: IndexPath) {
        collection.reloadItems(at: [indexPath])
    }
  }
}


