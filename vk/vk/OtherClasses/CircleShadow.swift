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
}
@IBDesignable
final class CircleImage : UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = (bounds.height / 2)
    }
}
