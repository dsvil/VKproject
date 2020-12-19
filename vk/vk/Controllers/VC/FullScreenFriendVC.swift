//
//  FullScreenFriendVC.swift
//  vk
//
//  Created by Sergei Dorozhkin on 10.12.2020.
//

import UIKit

class FullScreenImageController: UIViewController {
    
    @IBOutlet weak var fullScreen: UIImageView!
    var startFromImage: Int!
    var friendImages: [ApiGetPhotosVK.PhotoStaff]!
    var gestureAnimator = UIViewPropertyAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        fullScreen.image = friendImages[startFromImage].sizes[4].url
        fullScreen.image = try? UIImage(data: Data(contentsOf: URL(string: friendImages[startFromImage].sizes[3].url ) ?? URL(string: "http://www.google.com")!))
    }
    
    @IBAction func gesture(recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        let scale = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let rotate = CGAffineTransform(rotationAngle: 0.5)
        let transformation = scale.concatenating(rotate)
        
        switch recognizer.state {
        case .began:
            gestureAnimator.startAnimation()
            gestureAnimator = UIViewPropertyAnimator(duration: 1.5,
                                                     dampingRatio: 0.8) {
                self.fullScreen.transform = transformation
                self.fullScreen.alpha = 0
            }
        case .changed:
            recognizer.view!.center = CGPoint(x:view.center.x + translation.x , y:view.center.y + translation.y)
            gestureAnimator.fractionComplete = abs (translation.x) / 100
            if translation.y > 100 {
                dismiss(animated: true, completion: nil)
            }
        //        Dismiss сбрасывает экран и возвращается на предыдущий
        case .ended:
            gestureAnimator.stopAnimation(true)
            gestureAnimator.addAnimations {
                if translation.x > 120 {
                    if self.startFromImage > 0 {
                        self.startFromImage -= 1
                    }
                    else {
                        self.startFromImage = 0
                    }
                } else {
                    if self.startFromImage < self.friendImages.count - 1 {
                        self.startFromImage += 1
                    } else {
                        self.startFromImage = self.friendImages.count - 1
                    }
                }
                self.fullScreen.image = try? UIImage(data: Data(contentsOf: URL(string: self.friendImages[self.startFromImage].sizes[3].url ) ?? URL(string: "http://www.google.com")!))
                
                self.fullScreen.alpha = 1
                self.fullScreen.transform = .identity
                self.fullScreen.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
            }
            gestureAnimator.startAnimation()
        default: break
        }
    }
}
