//
//  NewsTextCell.swift
//  VKClient
//
//  Created by Aleksandr Serov on 26.02.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class NewsTextCell: UITableViewCell {

    @IBOutlet weak var newsTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with news: News?) {

        newsTextLabel.text = news?.newsText
       
        }
        
    }


