//
//  SetUpBars.swift
//  vk
//
//  Created by Sergei Dorozhkin on 27.11.2020.
//

import UIKit

extension UIViewController {
    func setUpNavTabBars() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = UIColor.white
        navigationBarAppearance.barTintColor = UIColor.black
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        let searchField = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        searchField.backgroundColor = UIColor.black
        searchField.textColor = UIColor.white
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.tintColor = UIColor.white
        tabBarAppearance.barTintColor = UIColor.black
    }
}
