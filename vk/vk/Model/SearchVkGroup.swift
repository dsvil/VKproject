//
//  SearchVkGroup.swift
//  vk
//
//  Created by Sergei Dorozhkin on 18.12.2020.
//

import Foundation
import Alamofire


//class Response: Decodable {
//    var response: Datable
//}
//class Datable: Decodable {
//    var items: [VkGroup]
//}
//struct VkGroup: Decodable {
//    dynamic var id: Int = 0
//    dynamic var name: String = ""
//    dynamic var icon: String = ""
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case icon = "photo_200"
//    }

final class ApiGetGroupsVKSearch {
    
    static let baseUrl = "https://api.vk.com/method/"
    static  let version = "5.126"
    static func getData(searchText: String, completion: @escaping ([VkGroup]) -> Void){
        let request = "groups.search"
        guard let apiKey = Session.instance.token else {return}
        let parameters: Parameters = [
            "q": searchText,
            "type": "group",
            "sort": 0,
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
