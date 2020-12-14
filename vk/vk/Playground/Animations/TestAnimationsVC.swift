//
//  TestAnimations.swift
//  vk
//
//  Created by Sergei Dorozhkin on 07.12.2020.
//

import UIKit

class TestAnimations: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label2TopConst: NSLayoutConstraint!
    
    @IBOutlet weak var playButton: UIBarButtonItem!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var play2Button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func play(_ sender: Any) {
        //        UIView.animate(withDuration: 0.5,
        //                       animations: {
        //                        self.label.frame.origin.y = 200
        //                       })
        //        UIView.animate(withDuration: 0.5,
        //                       delay: 0.5,
        //                       animations: {
        //                        self.label.alpha = 0.5
        //                       })
        
        UIView.animate(withDuration: 1,
                       animations: {
                        self.label2TopConst.constant += 100
                        self.view.layoutIfNeeded()
                       })
        //
        //        UIView.animate(withDuration: 0.5,
        //                       delay: 0,
        //                       options: [.autoreverse],
        //                       animations: {self.label.frame.origin.y += 100},
        //                       completion: { _ in
        //                        self.label.frame.origin.y -= 100
        //                       })
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.repeat, .autoreverse, .curveEaseInOut],
                       animations: {
                        self.label.frame.origin.y += 100
                       })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.label.layer.removeAllAnimations()
        })
        
        UIView.transition(with: view,
                          duration: 2,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.label3.text = "Dissolve"
                          })
        UIView.transition(from: label4,
                          to: image,
                          duration: 1,
                          options: .transitionCrossDissolve)
        self.image.alpha = 1
        self.playButton.isEnabled = false
        
    }
    
    @IBAction func play2(_ sender: Any) {
        //        let animation = CABasicAnimation(keyPath: "position.y")
        //        animation.beginTime = CACurrentMediaTime() + 0.5
        //        animation.fromValue = label5.layer.position.y
        //        animation.toValue = label5.layer.position.y + 100
        //        animation.duration = 1
        //        animation.fillMode = .forwards
        //        animation.isRemovedOnCompletion = false
        //        label5.layer.add(animation, forKey: nil)
        
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.toValue = label5.layer.position.y + 200
        
        let alfa = CABasicAnimation(keyPath: "opacity")
        alfa.toValue = 0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2
        animationGroup.fillMode = CAMediaTimingFillMode.backwards
        animationGroup.animations = [animation, alfa]
        animationGroup.timingFunction = CAMediaTimingFunction(controlPoints: 0, 1, 1, 0.1)
        label5.layer.add(animationGroup, forKey: nil)
        
        //        UIView.animate(withDuration: 0.5,
        //                       delay: 1.5,
        //                       usingSpringWithDamping: 0.5,
        //                       initialSpringVelocity: 0,
        //                       options: [],
        //                       animations: {
        //                           self.label5.frame.origin.y += 100
        //                       })
    }
}
