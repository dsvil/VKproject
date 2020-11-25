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
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    let gradient = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.insertSublayer(gradient, at: 0)
        gradient.colors = [
            UIColor.black.cgColor,
            UIColor.white.withAlphaComponent(0.5).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = contentView.bounds
    }
    
}
