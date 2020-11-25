//
//  LikeControl.swift
//  vk
//
//  Created by Sergei Dorozhkin on 25.11.2020.
//

import UIKit
final class LikeControl: UIControl {
    let likeHeart = UIImageView()
    let count = UILabel()
    let stack = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        count.textColor = .lightGray
        count.text = " "
        count.alpha = 0.5
        likeHeart.image = UIImage(systemName: "heart")
        likeHeart.tintColor = .lightGray
        likeHeart.alpha = 0.5
        stack.addArrangedSubview(likeHeart)
        stack.addArrangedSubview(count)
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.isUserInteractionEnabled = false
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
     
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if count.text == " " {
            count.text = "1"
            likeHeart.image = UIImage(systemName: "heart.fill")
            count.textColor = .red
            likeHeart.tintColor = .red
            count.alpha = 1
            likeHeart.alpha = 1
        } else {
            count.text = " "
            likeHeart.image = UIImage(systemName: "heart")
            count.textColor = .lightGray
            likeHeart.tintColor = .lightGray
            count.alpha = 0.5
            likeHeart.alpha = 0.5
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.7
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.backwards
        self.likeHeart.layer.add(animation, forKey: nil)
        self.count.layer.add(animation, forKey: nil)
    }
}
