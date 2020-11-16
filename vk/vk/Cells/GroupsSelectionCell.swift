//
//  GroupsSelectionCell.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

class GroupsSelectionCell: UITableViewCell {
    
    @IBOutlet weak var groupsSelectionIcon: UIImageView!
    @IBOutlet weak var groupsSelectionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
