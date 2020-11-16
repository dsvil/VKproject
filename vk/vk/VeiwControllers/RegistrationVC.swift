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
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "Continue":
            let check1 = checkCount()
            let check2 = checkPwd()
            if !check1 {alertCount()}
            if !check2 {alertPwd()}
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
    
    func alertCount() {
        let alter = UIAlertController(
            title: "Ошибка",
            message: "Слишком короткое имя пользователя, введите другое",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "WTF?!",
            style: .cancel,
            handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    func alertPwd() {
        let alter = UIAlertController(
            title: "Ошибка",
            message: "Пароли не совпадают",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "WTF?!",
            style: .cancel,
            handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    
}
