//
//  Gradient.swift
//  vk
//
//  Created by Дорожкин Сергей on 14.11.2020.
//

import UIKit

final class MiddleView: UIView {
    let gradientLayer = CAGradientLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0 as NSNumber, 1 as NSNumber]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        layer.addSublayer(gradientLayer)
        gradientLayer.frame = self.bounds
       
    }
}

