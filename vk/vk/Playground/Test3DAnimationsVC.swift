//
//  3DAnimations.swift
//  vk
//
//  Created by Sergei Dorozhkin on 11.12.2020.
//

import UIKit

class ThreeDAnimations: UIViewController {
    
    @IBOutlet weak var myView: CircleView!
    var viewIsShown: Bool = true
    var animator = UIViewPropertyAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.layer.cornerRadius = 25
        
        let rotation = CATransform3DMakeRotation(.pi, 0, 1, 0)
        let scale = CATransform3DScale(CATransform3DIdentity, 0.8, 0.8, 0)
        let transform = CATransform3DConcat(rotation, scale)
        
        animator = UIViewPropertyAnimator(duration: 3, curve: .easeInOut) { [self] in
            self.myView.transform = CATransform3DGetAffineTransform(transform)
        }
        animator.addCompletion({ (position) in
            if position == .end {
                self.viewIsShown.toggle()
            }
        })
    }
    
    
    @IBAction func toggleViewVisibility() {
        //        UIView.animate(withDuration: 1, animations: {
        //            if self.viewIsShown {
        //                self.myView.transform = CATransform3DGetAffineTransform(transform)
        //            } else {
        //                self.myView.transform = .identity
        //            }
        //        }, completion: { _ in
        //            self.viewIsShown.toggle()
        //        })
        
        if self.viewIsShown {
            animator.startAnimation()
            
        } else {
            animator.addAnimations {
                self.myView.transform = .identity
            }
            animator.startAnimation()
        }
        
    }
    @IBAction func pause(_ sender: Any) {
        if animator.isRunning == true {
            animator.pauseAnimation()
        } else {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 1)}
        
// Блок завершения анимации, когда нужно закончить анимацию и потом вернуть ее либо в конец, либо в начало
//        animator.stopAnimation(false)
//        animator.finishAnimation(at: .end)
        
    }
}


