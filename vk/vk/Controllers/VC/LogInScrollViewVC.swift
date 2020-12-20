
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
        setUpNavTabBars()
    }
    
    @IBAction func tapScreen(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBOutlet weak var scrollBottom: NSLayoutConstraint!

    @IBOutlet weak var pageTitle: UILabel!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "LogInSegue":
            return true
        case "SignIn":
            return true
        case "Direct":
            return true
        default:
            return false
        }
    }
    
    @IBAction func returnToLogInScreen(unwindSegue: UIStoryboardSegue) {}
}

