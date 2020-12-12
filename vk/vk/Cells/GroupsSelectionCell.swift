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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setGradientForCells()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
