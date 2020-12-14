//
//  TransitionSegueAnimated.swift
//  vk
//
//  Created by Sergei Dorozhkin on 14.12.2020.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        destination.transitioningDelegate = TransitionSegueDelegate.instance
        source.present(destination, animated: true)
    }
}

final class TransitionSegueDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    static let instance = TransitionSegueDelegate()
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimatorNav ()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimatorNav ()
    }
}
