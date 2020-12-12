//
//  GetFriends.swift
//  vk
//
//  Created by Дорожкин Сергей on 15.11.2020.
//

import UIKit

struct User {
    let fio: String
    let icon: UIImage
    let image: [UIImage]
    var titleFirstLetter: String {
        return String(fio[fio.startIndex])
    }
}

final class GetFriends {
    
    static func getFriends() -> [User] {
        let ivanov = User(fio: "Ivanov Petr",
                          icon: UIImage(named: "b1")!,
                          image:
                            [UIImage(named: "b1")!,
                             UIImage(named: "b2")!,
                             UIImage(named: "b3")!])
        let petrov = User(fio: "Petrov Ivan",
                          icon: UIImage(named: "a1")!,
                          image:
                            [UIImage(named: "a1")!,
                             UIImage(named: "a2")!,
                             UIImage(named: "a3")!])
        let kozodoev =  User(fio: "Kozodoev Vasya",
                             icon: UIImage(named: "k1")!,
                             image:
                                [UIImage(named: "k1")!,
                                 UIImage(named: "k2")!,
                                 UIImage(named: "k3")!])
        let kozlov =  User(fio: "Kozlov Sergey",
                           icon: UIImage(named: "s1")!,
                           image:
                            [UIImage(named: "s1")!,
                             UIImage(named: "s2")!,
                             UIImage(named: "s3")!])
        let radiko = User(fio: "Radiko Petr",
                          icon: UIImage(named: "b1")!,
                          image:
                            [UIImage(named: "b1")!,
                             UIImage(named: "b2")!,
                             UIImage(named: "b3")!])
        let kuev = User(fio: "Kuev Ivan",
                        icon: UIImage(named: "a1")!,
                        image:
                            [UIImage(named: "a1")!,
                             UIImage(named: "a2")!,
                             UIImage(named: "a3")!])
        let molodets =  User(fio: "Molodets Vasya",
                             icon: UIImage(named: "k1")!,
                             image:
                                [UIImage(named: "k1")!,
                                 UIImage(named: "k2")!,
                                 UIImage(named: "k3")!])
        let selfish =  User(fio: "Selfish Sergey",
                            icon: UIImage(named: "s1")!,
                            image:
                                [UIImage(named: "s1")!,
                                 UIImage(named: "s2")!,
                                 UIImage(named: "s3")!])
        
        return [ivanov, petrov, kozodoev, kozlov, radiko, kuev, molodets, selfish]
    }
}
