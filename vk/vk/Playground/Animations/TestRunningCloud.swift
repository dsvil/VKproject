//
//  RunningCloud.swift
//  vk
//
//  Created by Sergei Dorozhkin on 10.12.2020.
//

import UIKit

class RunningCloud: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 28.3*2, y: 31.35*2))
        bezierPath.addLine(to: CGPoint(x: 29.809*2, y: 30.283*2))
        bezierPath.addLine(to: CGPoint(x: 31.66*2, y: 29.694*2))
        bezierPath.addLine(to: CGPoint(x: 32.85*2, y: 29.616*2))
        bezierPath.addLine(to: CGPoint(x: 34.311*2, y: 29.622*2))
        bezierPath.addLine(to: CGPoint(x: 34.702*2, y: 30.24*2))
        bezierPath.addLine(to: CGPoint(x: 35.22*2, y: 28.702*2))
        bezierPath.addLine(to: CGPoint(x: 35.647*2, y: 27.652*2))
        bezierPath.addLine(to: CGPoint(x: 36.633*2, y: 26.377*2))
        bezierPath.addLine(to: CGPoint(x: 37.633*2, y: 25.574*2))
        bezierPath.addLine(to: CGPoint(x: 38.794*2, y: 24.886*2))
        bezierPath.addLine(to: CGPoint(x: 39.91*2, y: 24.557*2))
        bezierPath.addLine(to: CGPoint(x: 41.838*2, y: 24.393*2))
        bezierPath.addLine(to: CGPoint(x: 42.977*2, y: 24.514*2))
        bezierPath.addLine(to: CGPoint(x: 44.204*2, y: 24.892*2))
        bezierPath.addLine(to: CGPoint(x: 45.229*2, y: 25.5*2))
        bezierPath.addLine(to: CGPoint(x: 48.902*2, y: 23.498*2))
        bezierPath.addLine(to: CGPoint(x: 49.768*2, y: 22.198*2))
        bezierPath.addLine(to: CGPoint(x: 50.988*2, y: 20.66*2))
        bezierPath.addLine(to: CGPoint(x: 52.612*2, y: 19.178*2))
        bezierPath.addLine(to: CGPoint(x: 54.708*2, y: 17.845*2))
        bezierPath.addLine(to: CGPoint(x: 56.889*2, y: 16.766*2))
        bezierPath.addLine(to: CGPoint(x: 59.092*2, y: 16.205*2))
        bezierPath.addLine(to: CGPoint(x: 61.206*2, y: 15.78*2))
        bezierPath.addLine(to: CGPoint(x: 63.82*2, y: 15.814*2))
        bezierPath.addLine(to: CGPoint(x: 66.971*2, y: 16.443*2))
        bezierPath.addLine(to: CGPoint(x: 69.195*2, y: 17.333*2))
        bezierPath.addLine(to: CGPoint(x: 70.956*2, y: 18.342*2))
        bezierPath.addLine(to: CGPoint(x: 72.873*2, y: 19.835*2))
        bezierPath.addLine(to: CGPoint(x: 74.662*2, y: 21.913*2))
        bezierPath.addLine(to: CGPoint(x: 75.866*2, y: 23.634*2))
        bezierPath.addLine(to: CGPoint(x: 76.847*2, y: 25.848*2))
        bezierPath.addLine(to: CGPoint(x: 77.659*2, y: 28.227*2))
        bezierPath.addLine(to: CGPoint(x: 77.912*2, y: 29.57*2))
        bezierPath.addLine(to: CGPoint(x: 78.012*2, y: 31.469*2))
        bezierPath.addLine(to: CGPoint(x: 81.13*2, y: 29.496*2))
        bezierPath.addLine(to: CGPoint(x: 82.058*2, y: 29.39*2))
        bezierPath.addLine(to: CGPoint(x: 83.389*2, y: 29.607*2))
        bezierPath.addLine(to: CGPoint(x: 85.036*2, y: 30.087*2))
        bezierPath.addLine(to: CGPoint(x: 86.522*2, y: 30.919*2))
        bezierPath.addLine(to: CGPoint(x: 87.99*2, y: 31.714*2))
        bezierPath.addLine(to: CGPoint(x: 89.272*2, y: 32.688*2))
        bezierPath.addLine(to: CGPoint(x: 90.44*2, y: 33.926*2))
        bezierPath.addLine(to: CGPoint(x: 91.333*2, y: 35.334*2))
        bezierPath.addLine(to: CGPoint(x: 92.084*2, y: 37.07*2))
        bezierPath.addLine(to: CGPoint(x: 92.656*2, y: 38.815*2))
        bezierPath.addLine(to: CGPoint(x: 92.783*2, y: 40.272*2))
        bezierPath.addLine(to: CGPoint(x: 92.678*2, y: 42.647*2))
        bezierPath.addLine(to: CGPoint(x: 92.261*2, y: 44.755*2))
        bezierPath.addLine(to: CGPoint(x: 91.132*2, y: 47.311*2))
        bezierPath.addLine(to: CGPoint(x: 89.469*2, y: 49.187*2))
        bezierPath.addLine(to: CGPoint(x: 87.331*2, y: 51.141*2))
        bezierPath.addLine(to: CGPoint(x: 85.474*2, y: 52.201*2))
        bezierPath.addLine(to: CGPoint(x: 83.059*2, y: 52.848*2))
        bezierPath.addLine(to: CGPoint(x: 32.349*2, y: 52.824*2))
        bezierPath.addLine(to: CGPoint(x: 30.47*2, y: 52.557*2))
        bezierPath.addLine(to: CGPoint(x: 28.655*2, y: 51.402*2))
        bezierPath.addLine(to: CGPoint(x: 26.764*2, y: 49.952*2))
        bezierPath.addLine(to: CGPoint(x: 25.757*2, y: 49.004*2))
        bezierPath.addLine(to: CGPoint(x: 24.489*2, y: 47.523*2))
        bezierPath.addLine(to: CGPoint(x: 23.655*2, y: 45.569*2))
        bezierPath.addLine(to: CGPoint(x: 22.987*2, y: 43.05*2))
        bezierPath.addLine(to: CGPoint(x: 22.731*2, y: 40.498*2))
        bezierPath.addLine(to: CGPoint(x: 23.255*2, y: 37.845*2))
        bezierPath.addLine(to: CGPoint(x: 24.414*2, y: 35.408*2))
        bezierPath.addLine(to: CGPoint(x: 25.842*2, y: 33.717*2))
        bezierPath.addLine(to: CGPoint(x: 28.35*2, y: 31.35*2))
        bezierPath.close()
        
        let layerPath = CAShapeLayer()
        layerPath.path = bezierPath.cgPath
        layerPath.strokeColor = UIColor.red.cgColor
        layerPath.fillColor = UIColor.clear.cgColor
        layerPath.lineWidth = 5
        layerPath.lineCap = .round
        layerPath.opacity = 1
        //        layerPath.position.x = 80
        //        layerPath.position.y = 200
        view.layer.addSublayer(layerPath)
        
        // Эта анимация постепенно заполняет контур облака
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        pathAnimation.duration = 3
        pathAnimation.fillMode = .both
        pathAnimation.isRemovedOnCompletion = false
        layerPath.add(pathAnimation, forKey: nil)
        
        // Эта анимация делает бекущую строку по контуру облака
        //        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        //        strokeStartAnimation.fromValue = 0
        //        strokeStartAnimation.toValue = 1
        //        strokeStartAnimation.duration = 5
        //        strokeStartAnimation.fillMode = .both
        //        strokeStartAnimation.beginTime = 0.4
        //        strokeStartAnimation.isRemovedOnCompletion = false
        //
        //        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        //        strokeEndAnimation.fromValue = 0
        //        strokeEndAnimation.toValue = 1
        //        strokeEndAnimation.duration = 5
        //        strokeEndAnimation.beginTime = 0
        //        strokeEndAnimation.fillMode = .both
        //        strokeEndAnimation.isRemovedOnCompletion = false
        //
        //        let animationGroup = CAAnimationGroup()
        //        animationGroup.duration = 5.5
        //        animationGroup.repeatCount = 3
        //        animationGroup.fillMode = CAMediaTimingFillMode.both
        //        animationGroup.isRemovedOnCompletion = false
        //        animationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
        //
        //        layerPath.add(animationGroup, forKey: nil)
        
        let circleLayer = CAShapeLayer()
        circleLayer.backgroundColor = UIColor.black.cgColor
        circleLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        circleLayer.position = CGPoint(x: 28.3*2, y: 31.35*2)
        circleLayer.cornerRadius = 10
        view.layer.addSublayer(circleLayer)
        
        let followPathAnimation = CAKeyframeAnimation(keyPath: "position")
        followPathAnimation.path =  bezierPath.cgPath
        followPathAnimation.duration = 5
        followPathAnimation.repeatCount = 2
        followPathAnimation.calculationMode = CAAnimationCalculationMode.paced
        circleLayer.add(followPathAnimation, forKey: nil)
        
    }
}
