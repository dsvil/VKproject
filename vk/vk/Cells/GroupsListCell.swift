//
//  GroupsListCell.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class GroupsListCell: UITableViewCell {
    
    @IBOutlet weak var groupsListLabel: UILabel!
    @IBOutlet weak var groupsListIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
