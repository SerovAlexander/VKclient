//
//  NewsFooterCell.swift
//  VKClient
//
//  Created by Aleksandr Serov on 01.03.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class NewsFooterCell: UITableViewCell {

    @IBAction func setLike(_ sender: Any) {
        (sender as! ButtonLike).liked = !(sender as! ButtonLike).liked
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
