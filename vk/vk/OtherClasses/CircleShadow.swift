//
//  CircleShadow.swift
//  vk
//
//  Created by Sergei Dorozhkin on 25.11.2020.
//

import UIKit

@IBDesignable
final class CircleView: UIView {
    @IBInspectable
    var shadowColor: UIColor = UIColor.black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
            setNeedsDisplay()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = (bounds.height / 2)
        layer.shadowOffset = CGSize(width: 3, height: 2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.8
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.backwards
        self.layer.add(animation, forKey: nil)
    }
}
@IBDesignable
final class CircleImage : UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = (bounds.height / 2)
    }
}
