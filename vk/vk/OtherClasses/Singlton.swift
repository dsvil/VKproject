//
//  Singlton.swift
//  vk
//
//  Created by Дорожкин Сергей on 14.11.2020.
//

import Foundation

class UserData {
    var logIn: String
    var pwd: String
    private init(logIn: String, pwd:String){
        self.logIn = logIn
        self.pwd = pwd
    }
    static let instance = UserData(logIn: "1", pwd: "1")
}

