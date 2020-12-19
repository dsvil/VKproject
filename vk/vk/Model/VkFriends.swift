//
//  VkFriends.swift
//  vk
//
//  Created by Sergei Dorozhkin on 18.12.2020.
//

import Foundation
import UIKit
import Alamofire

class ApiGetFriendsVK {
    
    class Response: Decodable {
        var response: Datable
    }
    class Datable: Decodable {
        var items: [VkFriend]
    }
    struct VkFriend: Decodable {
        dynamic var id: Int = 0
        dynamic var firstName: String = ""
        dynamic var lastName: String = ""
        dynamic var icon: String = ""
        
        enum CodingKeys: String, CodingKey {
            case id
            case firstName = "first_name"
            case lastName = "last_name"
            case icon = "photo_100"
        }
    }
    
    static let baseUrl = "https://api.vk.com/method/"
    static let version = "5.126"
    static func getData(completion: @escaping ([VkFriend]) -> Void){
        let request = "friends.get"
        guard let user = Session.instance.userId else {return}
        guard let apiKey = Session.instance.token else {return}
        let parameters: Parameters = [
            "user_ids": user,
            "fields": "photo_100",
            "access_token": apiKey,
            "v": version
        ]
        let url = baseUrl+request
        AF.request(url, method: .get, parameters:
                    parameters).responseData {repsonse in
                        guard let data = repsonse.value  else {return}
                        let friends = try! JSONDecoder().decode(Response.self, from: data)
                        completion(friends.response.items)
                    }
    }
}
