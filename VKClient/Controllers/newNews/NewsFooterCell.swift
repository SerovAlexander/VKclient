//
//  NewsFooterCell.swift
//  VKClient
//
//  Created by Aleksandr Serov on 01.03.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import RealmSwift


class NewsFooterCell: UITableViewCell {

//    private lazy var news =  try? Realm().objects(News.self)
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCount: UILabel!
    private lazy var newss =  try? Realm().objects(News.self)
    var news = News()
    var likeState = false
    
    
    @IBAction func setLike(_ sender: Any) {
        var likes = news.likesCount
    if !likeState {
               likeButton.setImage(UIImage(named: "FullHeart"), for: UIControl.State.normal)
                  likes = likes + 1
                  self.likeCount.text = String(likes)
               likeState.toggle()
       
           }else {
               likeButton.setImage(UIImage(named: "EmptyHeart"), for: UIControl.State.normal)
               likeState.toggle()

           }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with news: News?) {
        
        likeCount.text = String(news?.likesCount ?? 0)

        }
    
     }
 
