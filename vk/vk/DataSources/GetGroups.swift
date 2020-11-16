//
//  GetGroups.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

struct Group {
    let name: String
    let icon: UIImage
}

final class GetGroups {
    
    static func myGroups() -> [Group] {
        let one =  Group(name: "News", icon: UIImage(named: "news")!)
        let two =  Group(name: "Sex", icon: UIImage(named: "sex")!)
        let three =  Group(name: "Violence", icon: UIImage(named: "violence")!)
        let four =  Group(name: "Sience", icon: UIImage(named: "sience")!)
        let five =  Group(name: "Skills", icon: UIImage(named: "skills")!)
        
        return [one, two, three, four, five]
    }
    
    static func publicGroups() -> [Group] {
        
        let one = Group(name: "Friends", icon: UIImage(named: "g1")!)
        let two = Group(name: "Movies", icon: UIImage(named: "movie")!)
        let three = Group(name: "TV Shows", icon: UIImage(named: "g3")!)
        let four = Group(name: "Theaters", icon: UIImage(named: "theater")!)
        let five = Group(name: "Cooking", icon: UIImage(named: "cooking")!)
        
        return [one, two, three, four, five]
    }
}
