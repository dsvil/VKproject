//
//  myVKGroup.swift
//  vk
//
//  Created by Sergei Dorozhkin on 18.12.2020.
//

import Foundation
import Alamofire

class Response: Decodable {
    var response: Datable
}
class Datable: Decodable {
    var items: [VkGroup]
}
struct VkGroup: Decodable {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var icon: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case icon = "photo_200"
    }
//    convenience required init(from decoder: Decoder) throws {
//            self.init()
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try values.decode(Int.self, forKey: .id)
//        self.name = try values.decode(String.self, forKey: .name)
//        self.icon = try values.decode(String.self, forKey: .icon)
//    }
}
final class ApiGetGroupsVK {
    
   static let baseUrl = "https://api.vk.com/method/"
   static let version = "5.126"
    static func getData(fields: String?, completion: @escaping ([VkGroup]) -> Void) {
        guard let user = Session.instance.userId else {return}
        guard let apiKey = Session.instance.token else {return}
        let request = "groups.get"
        let parameters: Parameters = [
            "user_ids": user,
            "extended": 1,
            "fields": fields as Any,
            "access_token": apiKey,
            "v": version
        ]
        let url = baseUrl+request
        AF.request(url, method: .get, parameters:
                    parameters).responseData {repsonse in
                        guard let data = repsonse.value  else {return}
                        let groups = try! JSONDecoder().decode(Response.self, from: data)
                        completion(groups.response.items)
                    }
    }
}

