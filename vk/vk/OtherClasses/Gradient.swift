//
//  Gradient.swift
//  vk
//
//  Created by Дорожкин Сергей on 17.11.2020.
//

import UIKit

@IBDesignable
final class GragientView: UIView {
    
    var gradientLayer: CAGradientLayer {return layer as! CAGradientLayer}
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.red.cgColor]
        gradientLayer.locations = [0.4, 0.7, 0.9]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
    }
}


@IBDesignable
final class GradientTable: UITableView {
    
    var rootLayer: CAGradientLayer {return layer as! CAGradientLayer}
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        rootLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.red.cgColor]
        rootLayer.locations = [0.4, 0.7, 0.9]
        rootLayer.startPoint = CGPoint.zero
        rootLayer.endPoint = CGPoint(x: 0, y: 1)
    }
}

extension UITableViewCell {
    open func setGradientForCells() {
        let gradient = CAGradientLayer()
        contentView.layer.insertSublayer(gradient, at: 0)
        gradient.colors = [
            UIColor.black.cgColor,
            UIColor.white.withAlphaComponent(0.5).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.frame = contentView.bounds
    }
}


