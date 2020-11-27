
//  vk
//
//  Created by Дорожкин Сергей on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitle.text = "Vkontakte"
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
        
        setUpNavTabBars()
    }
    
    @IBAction func tapScreen(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
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
    
    @IBOutlet weak var logIn: UITextField!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var pageTitle: UILabel!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "LogInSegue":
            let check =  logInTest ()
            if !check {alert()}
            return check
        case "SignIn":
            return true
        default:
            return false
        }
    }
    func alert() {
        let alter = UIAlertController(
            title: "Ошибка",
            message: "Введены не верные данные пользователя или пароль",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "WTF?!",
            style: .cancel,
            handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    func logInTest () -> Bool {
        let logn: String = logIn.text!
        let pass: String = pwd.text!
        return logn == UserData.instance.logIn && pass == UserData.instance.pwd
    }
    
    @IBAction func returnToLogInScreen(unwindSegue: UIStoryboardSegue) {}
}

