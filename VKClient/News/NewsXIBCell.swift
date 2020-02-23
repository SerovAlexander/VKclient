//
//  NewsXIBCell.swift
//  VKClient
//
//  Created by Aleksandr Serov on 03/09/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher

class NewsXIBCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLAbel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var newsTextLabel: UILabel!
    
    @IBAction func likeButtonTap(_ sender: Any) {
        
        if likeButton.currentImage!.isEqual(UIImage(named: "EmptyHeart")) {
            likeButton.setImage(UIImage(named: "FullHeart"), for: .normal)
        } else {return}
        //        if likesCount == 0 {
        //            likesCount += 1
        //            likeButton.setImage(UIImage(named: "FullHeart"), for: .normal)
        //            likeCountLabel.text = String(likesCount)
        //        } else {
        //            likesCount -= 1
        //            likeButton.setImage(UIImage(named: "EmptyHeart"), for: .normal)
        //            likeCountLabel.text = String(likesCount)
        //        }
    }
    
    @IBAction func commentButtonTap(_ sender: Any){
    }
    
    
    @IBAction func shareButtonTap(_ sender: Any){
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImage.layer.cornerRadius  = 27
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    public func configure(with news: News?, dateString: String) {
        
        guard var sourceId = news?.sourceId else { return }
        var postAutor: String = ""
        var avatarURL: String = ""
        var postImageUrl: String = ""
        guard sourceId != 0 else { return }
        if sourceId > 0 {
            if news == nil {
                return
            }
            guard let sourceDB = try? Realm().objects(User.self).filter("id == %@", sourceId),
                let user = sourceDB.first
                else { return }
            postAutor = user.firstName + " " + user.secondName
            avatarURL = user.avatar
            postImageUrl = news?.postPhoto ?? ""
            
        } else {
            sourceId = -sourceId
            if news == nil {
                return
            }
            guard let sourceDB = try? Realm().objects(Items.self).filter("id == %@", sourceId),
                  let group = sourceDB.first
            else {return}
            postAutor = group.name
            avatarURL = group.photo_100
            postImageUrl = news?.postPhoto ?? ""
        }
        avatarImage.kf.setImage(with: URL(string: avatarURL))
        nameLAbel.text = postAutor
        newsTextLabel.text = news?.newsText
        dataLabel.text = dateString
        imageView?.kf.setImage(with: URL(string: postImageUrl))
        likeCountLabel.text = String(news?.likesCount ?? 0 )
        commentCountLabel.text = String(news?.commentsCount ?? 0)
        
        if news?.userLike == 1{
            likeButton.setImage(UIImage(named: "FullHeart"), for: .normal)
            
        }
        
    }
    
}

