//
//  NewsControls.swift
//  vk
//
//  Created by Sergei Dorozhkin on 28.11.2020.
//

import UIKit

final class NewsControls: UIControl {
    let object = UIImageView()
    let count = UILabel()
    let stack = UIStackView()
    var counter = 0
    
    func initSetUp(_ image:String, _ text: String, _ color:UIColor = .lightGray) {
        count.textColor = color
        count.text = text
        object.image = UIImage(systemName: image)
        object.tintColor = color
        object.backgroundColor = .clear
    }    
    override func awakeFromNib() {
        super.awakeFromNib()
        stack.addArrangedSubview(object)
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
    func likes(){
        if count.text == "0" {
            count.text = "1"
            object.image = UIImage(systemName: "heart.fill")
            count.textColor = .red
            object.tintColor = .red
        } else {
            count.text = "0"
            object.image = UIImage(systemName: "heart")
            count.textColor = .lightGray
            object.tintColor = .lightGray
        }
    }
    func countAmount(){
        counter += 1
        count.text = String(counter)
        count.textColor = .blue
        object.tintColor = .blue
    }
    func animateAuthButton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.7
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.backwards
        self.object.layer.add(animation, forKey: nil)
        self.count.layer.add(animation, forKey: nil)
    }
}


