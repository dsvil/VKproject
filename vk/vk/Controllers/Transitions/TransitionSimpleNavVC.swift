//
//  TransitionSimpleNavVC.swift
//  vk
//
//  Created by Sergei Dorozhkin on 14.12.2020.
//

import UIKit

class TransitionSimpleNavVC: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}
extension TransitionSimpleNavVC: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation:
                                UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController)
    -> UIViewControllerAnimatedTransitioning? {
        // В случае когда нам надо сделать разную анимацию на переход вперед и назад. Если нужен одинаковый переход и вперед и назад, можно просто убрать switch и поставить: return AnimatorNav()
        switch operation {
        case .push:
            return AnimatorNav()
        case .pop:
            return AnimatorNav()
        default:
            return nil
        }
    }
}
final class AnimatorNav: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        let containerViewFrame = transitionContext.containerView.frame
        
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: containerViewFrame.height,
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        
        let destinationViewTargetFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: 0,
                                        y: -containerViewFrame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)
        UIView
            .animate(withDuration: self.transitionDuration(using: transitionContext),
                     animations: {
                        source.view.frame = sourceViewTargetFrame
                        destination.view.frame = destinationViewTargetFrame
                     })
            { finished in
                transitionContext.completeTransition(finished)
            }
    }
}

