//
//  RegistrationVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 14.11.2020.
//

import UIKit

class RegistrationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        
        let offset = abs(self.logIn.frame.midY -
                            self.pwd.frame.midY)
        self.logIn.transform = CGAffineTransform(translationX: 0, y: offset)
        self.pwd.transform = CGAffineTransform(translationX: 0, y:
                                                -offset)
        UIView.animateKeyframes(withDuration: 1,
                                delay: 0,
                                options: .calculationModeCubicPaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        self.logIn.transform = CGAffineTransform(translationX: 150, y:
                                                                                                    50)
                                                        self.pwd.transform = CGAffineTransform(translationX: -150,
                                                                                               y: -50) })
                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        self.logIn.transform = .identity
                                                        self.pwd.transform = .identity
                                                       })
                                }, completion: nil)
        
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0
        fadeInAnimation.toValue = 1
        let scaleAnimation = CASpringAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        scaleAnimation.stiffness = 150
        scaleAnimation.mass = 2
        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 2
        animationsGroup.beginTime = CACurrentMediaTime()
        animationsGroup.timingFunction = CAMediaTimingFunction(name:
                                                                CAMediaTimingFunctionName.easeOut)
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        animationsGroup.animations = [fadeInAnimation, scaleAnimation]
        self.logInText.layer.add(animationsGroup, forKey: nil)
        self.firstPwdText.layer.add(animationsGroup, forKey: nil)
        self.secondPwdText.layer.add(animationsGroup, forKey: nil)
        
        self.titleLabel.transform = CGAffineTransform(translationX: 0, y:-100)
        let animator = UIViewPropertyAnimator(duration: 1,
                                              dampingRatio: 0.5,
                                              animations: {
                                                self.titleLabel.transform = .identity
                                              })
        animator.startAnimation(afterDelay: 1)
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        self.view.addGestureRecognizer(recognizer)
    }
    
    @IBOutlet weak var scrollBottom: NSLayoutConstraint!
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        scrollBottom.constant = frame.height
    }
    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollBottom.constant = 0
    }
    
    @IBAction func tapScreen(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var logInText: UITextField!
    @IBOutlet weak var firstPwdText: UITextField!
    @IBOutlet weak var secondPwdText: UITextField!
    @IBOutlet weak var logIn: UILabel!
    @IBOutlet weak var pwd: UILabel!
    @IBOutlet weak var reg: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var interactiveAnimator: UIViewPropertyAnimator!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "Continue":
            let check1 = checkCount()
            let check2 = checkPwd()
            if !check1 {alert("Слишком короткое имя пользователя, введите другое")}
            if !check2 {alert("Пароли не совпадают")}
            if check1 && check2 {
                UserData.instance.logIn = logInText.text!
                UserData.instance.pwd = firstPwdText.text!
                return true
            }
            return false
        default:
            return true
        }
    }
    func checkCount() -> Bool {
        let check = logInText.text!.count
        return check >= 3
    }
    func checkPwd() -> Bool {
        let pwd1 = firstPwdText.text!
        let pwd2 = secondPwdText.text!
        return pwd1 == pwd2
    }
    
    func alert(_ massage: String) {
        let alter = UIAlertController(
            title: "Ошибка",
            message: massage,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "WTF?!",
            style: .cancel,
            handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            interactiveAnimator?.startAnimation()
            interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                         dampingRatio: 0.5,
                                                         animations: {
                                                            self.reg.transform = CGAffineTransform(translationX: 0,y: 150) })
            
            interactiveAnimator.pauseAnimation()
        case .changed:
            let translation = recognizer.translation(in: self.view)
            interactiveAnimator.fractionComplete = translation.y / 100
        case .ended:
            interactiveAnimator.stopAnimation(true)
            interactiveAnimator.addAnimations {
                self.reg.transform = .identity
            }
            interactiveAnimator.startAnimation()
        default: return
        }
        
    }
}
