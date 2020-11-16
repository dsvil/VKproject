//
//  FriendsPhotosCCell.swift
//  vk
//
//  Created by Дорожкин Сергей on 16.11.2020.
//

import UIKit

class FriendsPhotosCCell: UICollectionViewCell {
    
    @IBOutlet weak var friendImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 25
    }
}
