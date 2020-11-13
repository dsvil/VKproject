
//  vk
//
//  Created by Дорожкин Сергей on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    @IBAction func logInBatton(_ sender: UIButton) {
        logInTest()
    }
    func logInTest () -> Bool {
        let logn: String = logIn.text!
        let pass: String = pwd.text!
        if logn == "1" && pass == "1" {
            print("LogIn successful")
            return true
        } else {
            print("LogIn bad")
            return false
        }
    }
    
}

