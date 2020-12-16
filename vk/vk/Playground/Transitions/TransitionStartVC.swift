//
//  TransitionStartVC.swift
//  vk
//
//  Created by Sergei Dorozhkin on 13.12.2020.
//

import UIKit

class TransitionStartVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(changeColor(notification:)),
            name: someNotification,
            object: "black")
        
        NotificationCenter.default.addObserver(
            forName: someNotification,
            object: "red",
            queue: .main,
            using: { notification in
                let color = notification.userInfo?["color"] as? UIColor ?? UIColor.blue
                self.view.backgroundColor = color
            })
    }
    
    @objc func changeColor(notification: Notification) {
            view.backgroundColor = .black
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self // очень важно делегат передать в конечный контроллер
        
    }
    
    @IBAction func menu(_ sender: Any) {
        dismiss(animated: true)
    }
}
extension TransitionStartVC: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Animator ()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Animator ()
    }
}
final class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
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
                source.removeFromParent()
                transitionContext.completeTransition(finished)
            }
    }
}


