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
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0, execute: {
            self.performSegue(withIdentifier: "Next", sender: self)
        })
        UIView.animateKeyframes(withDuration: 6,
                                delay: 0,
                                options: .repeat,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.45,
                                                       animations: {
                                                        self.view1.backgroundColor = UIColor.black
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.15,
                                                       relativeDuration: 0.30,
                                                       animations: {
                                                        self.view2.backgroundColor = UIColor.black
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.30,
                                                       relativeDuration: 0.16,
                                                       animations: {
                                                        self.view3.backgroundColor = UIColor.black
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.50,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        self.view3.backgroundColor = UIColor.red
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.65,
                                                       relativeDuration: 0.33,
                                                       animations: {
                                                        self.view2.backgroundColor = UIColor.red
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.80,
                                                       relativeDuration: 0.20,
                                                       animations: {
                                                        self.view1.backgroundColor = UIColor.red
                                                       })
                                    
                                },
                                completion: nil)
    }
}
