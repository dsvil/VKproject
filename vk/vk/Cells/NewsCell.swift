//
//  NewsCell.swift
//  vk
//
//  Created by Sergei Dorozhkin on 26.11.2020.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var likes: NewsControls!
    @IBOutlet weak var comment: NewsControls!
    @IBOutlet weak var eye: NewsControls!
    @IBOutlet weak var forward: NewsControls!

    
    @IBAction func likesPressed(_ sender: Any) {
        likes.likes()
        likes.animateAuthButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likes.initSetUp("heart", "0")
        comment.initSetUp("bubble.left", "0", .black)
        eye.initSetUp("eye", "0")
        forward.initSetUp("arrowshape.turn.up.right", "", .black)
    }
    
    @IBAction func commentsPressed(_ sender: Any) {
        comment.countAmount()
        comment.animateAuthButton()
    }
    
    @IBAction func eyePressed(_ sender: Any) {
        eye.countAmount()
        eye.animateAuthButton()
    }
    
    @IBAction func forwardPressed(_ sender: Any) {
        forward.animateAuthButton()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
