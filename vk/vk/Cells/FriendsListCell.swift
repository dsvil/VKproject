//
//  FriendsListCell.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class FriendsListCell: UITableViewCell {
    
    @IBOutlet weak var friendList: UILabel!
    
    @IBOutlet weak var friendIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
