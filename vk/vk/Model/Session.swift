//
//  Session.swift
//  vk
//
//  Created by Sergei Dorozhkin on 15.12.2020.
//

import Foundation
class Session {
    var token: String
    var userId: Int
    private init(token: String, userId:Int){
        self.token = token
        self.userId = userId
    }
    static let instance = Session (token: "", userId: 0)
}
