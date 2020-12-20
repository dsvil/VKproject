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
        case icon = "photo_50"
    }
}

final class ApiGetGroupsVK {
    
    static let baseUrl = "https://api.vk.com/method/"
    static let version = "5.126"
    static let user = Session.instance.userId
    static let apiKey = Session.instance.token
    static func getData(completion: @escaping ([VkGroup]) -> Void) {
        guard let user = Session.instance.userId else {return}
        guard let apiKey = Session.instance.token else {return}
        let request = "groups.get"
        let parameters: Parameters = [
            "user_ids": user,
            "extended": 1,
            "fields": "city,members_count,start_date",
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

//func getDataUrl(completion: @escaping ([VkGroup]) -> Void ){
//    let configuration = URLSessionConfiguration.default
//    let session = URLSession.init(configuration: configuration)
//    var urlConstructor = URLComponents()
//
//    urlConstructor.scheme = "https"
//    urlConstructor.host = "api.vk.com"
//    urlConstructor.path = "/method/groups.get"
//
//    urlConstructor.queryItems = [
//        URLQueryItem(name: "user_ids", value: String(Session.instance.userId!)),
//        URLQueryItem(name: "extended", value: "1"),
//        URLQueryItem(name: "fields", value: "city,members_count,start_date"),
//        URLQueryItem(name: "access_token", value: Session.instance.token!),
//        URLQueryItem(name: "v", value: "5.126")
//    ]
//    let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
//        if let error = error {
//            print(error)
//            return
//        }
//        guard let data = data else { return }
//        let groups = try! JSONDecoder().decode(Response.self, from: data)
//        completion(groups.response.items)
//    }
//    task.resume()
//}
