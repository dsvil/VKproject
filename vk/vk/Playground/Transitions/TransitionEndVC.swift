//
//  TransitionEndVC.swift
//  vk
//
//  Created by Sergei Dorozhkin on 13.12.2020.
//

import UIKit
class TransitionEndVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func close() {
        dismiss(animated: true)
    }
    let someNotification = Notification.Name("someNotification")
    @IBAction func blackObserver(_ sender: Any) {
        NotificationCenter.default.post(name: someNotification, object: "black")
    }
    
    @IBAction func redObserver(_ sender: Any) {
        NotificationCenter.default.post(name: someNotification, object: "red", userInfo: ["color": UIColor.red])
    }
    
}
