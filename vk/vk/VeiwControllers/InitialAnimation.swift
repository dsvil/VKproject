//
//  InitialAnimation.swift
//  vk
//
//  Created by Sergei Dorozhkin on 09.12.2020.
//

import UIKit

class InitialAnimation: UIViewController {
    
    @IBOutlet weak var view1: CircleView!
    @IBOutlet weak var view2: CircleView!
    @IBOutlet weak var view3: CircleView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 6, execute: {
            self.performSegue(withIdentifier: "Next", sender: self)
        })
        UIView.animateKeyframes(withDuration: 6,
                                delay: 0,
                                options: .repeat,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 1,
                                                       animations: {
                                                        self.view1.backgroundColor = UIColor.black
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.16,
                                                       relativeDuration: 1,
                                                       animations: {
                                                        self.view2.backgroundColor = UIColor.black
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.32,
                                                       relativeDuration: 1,
                                                       animations: {
                                                        self.view3.backgroundColor = UIColor.black
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.48,
                                                       relativeDuration: 1,
                                                       animations: {
                                                        self.view3.backgroundColor = UIColor.red
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.64,
                                                       relativeDuration: 1,
                                                       animations: {
                                                        self.view2.backgroundColor = UIColor.red
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.80,
                                                       relativeDuration: 1,
                                                       animations: {
                                                        self.view1.backgroundColor = UIColor.red
                                    })
                                    
        },
                                completion: nil)
    }
    
}
