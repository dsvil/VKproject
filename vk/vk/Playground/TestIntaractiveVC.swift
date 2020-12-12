//
//  TestIntaractiveVC.swift
//  vk
//
//  Created by Sergei Dorozhkin on 12.12.2020.
//

import UIKit

class TestIntaractiveVC: UIViewController {

    @IBOutlet weak var myView: UIView!
    var interactiveAnimator = UIViewPropertyAnimator()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func fryPan(_ recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        switch recognizer.state {
        case .began:
            interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                         curve: .easeInOut,
                                                         animations: {
//                                                            self.myView.frame = self.myView.frame.offsetBy(dx:0, dy: 100)
                                                            self.myView.alpha = 0
                                                         })
            
            interactiveAnimator.pauseAnimation()
        case .changed:
            
            interactiveAnimator.fractionComplete = abs(translation.y) / 100
            
        case .ended:
            interactiveAnimator.stopAnimation(true)
            interactiveAnimator.addAnimations {
                self.myView.alpha = 1
            }
            interactiveAnimator.startAnimation()
        default: return
        }
    }
}
