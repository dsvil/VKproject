//
//  TestMovingLinesVC.swift
//  vk
//
//  Created by Sergei Dorozhkin on 12.12.2020.
//

import UIKit

class TestMovingLinesVC: UIViewController {
    
    let firstLayer = CAShapeLayer()
    let secondLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLayer.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 4, height: 4)).cgPath
        secondLayer.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 4, height: 4)).cgPath
        firstLayer.backgroundColor = UIColor.red.cgColor
        secondLayer.backgroundColor = UIColor.red.cgColor
        firstLayer.frame = CGRect(x: 150, y: 200, width: 4, height: 4)
        secondLayer.frame = CGRect(x: 150, y: 200, width: 4, height: 4)
        firstLayer.masksToBounds = true
        secondLayer.masksToBounds = true
        firstLayer.cornerRadius = 2
        secondLayer.cornerRadius = 2
        self.view.layer.addSublayer(firstLayer)
        self.view.layer.addSublayer(secondLayer)
    }
    
    
    @IBAction func play(_ sender: Any) {
        
        let scale = CABasicAnimation(keyPath: "bounds.size.width")
        scale.byValue = 16
        scale.duration = 1
        scale.fillMode = CAMediaTimingFillMode.forwards
        scale.isRemovedOnCompletion = false
        
        let rotationLeft = CABasicAnimation(keyPath: "transform.rotation")
        rotationLeft.byValue = CGFloat.pi / 4
        rotationLeft.duration = 1
        rotationLeft.beginTime = CACurrentMediaTime() + 1
        rotationLeft.fillMode = CAMediaTimingFillMode.both
        rotationLeft.isRemovedOnCompletion = false
        
        let rotationRight = CABasicAnimation(keyPath: "transform.rotation")
        rotationRight.byValue = -CGFloat.pi / 4
        rotationRight.duration = 1
        rotationRight.beginTime = CACurrentMediaTime() + 1
        rotationRight.fillMode = CAMediaTimingFillMode.both
        rotationRight.isRemovedOnCompletion = false
        
        firstLayer.add(scale, forKey: nil)
        firstLayer.add(rotationLeft, forKey: nil)
        secondLayer.add(scale, forKey: nil)
        secondLayer.add(rotationRight, forKey: nil)
        
    }
}
