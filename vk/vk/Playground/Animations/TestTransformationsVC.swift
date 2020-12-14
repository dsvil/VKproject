//
//  TestTransformationsVC.swift
//  vk
//
//  Created by Sergei Dorozhkin on 10.12.2020.
//

import UIKit

class TestTransformationsVC: UIViewController {
    
    @IBOutlet weak var red: UIView!
    @IBOutlet weak var green: UIView!
    @IBOutlet weak var blue: UIView!
    
    let translation = CGAffineTransform(translationX: 10, y: 20)
    let scale = CGAffineTransform(scaleX: 1.5, y: 1.5)
    let rotation = CGAffineTransform(rotationAngle: .pi / 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touch(_ sender: Any) {
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.red.transform = self.translation.concatenating(self.rotation)
                       })
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.green.transform = self.scale
                       })
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.blue.transform = self.rotation
                       })
    }
    
}
