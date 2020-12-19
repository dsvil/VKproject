//
//  FriendsPhotos.swift
//  vk
//
//  Created by Sergei Dorozhkin on 18.12.2020.
//

import Foundation
import Alamofire

class ApiGetPhotosVK {
    
    class Response: Decodable {
        var response: Datable
    }
    class Datable: Decodable {
        var items: [PhotoStaff]
    }
    struct PhotoStaff: Decodable {
        var id: Int
        var sizes: [GetUrl]
    }
    struct GetUrl: Decodable {
        var type: String = ""
        var url: String = ""
    }
    static let baseUrl = "https://api.vk.com/method/"
    static let version = "5.126"
    static func getData(user:Int?, completion: @escaping ([PhotoStaff]) -> Void){
        let request = "photos.get"
        guard let apiKey = Session.instance.token else {return}
        let parameters: Parameters = [
            "owner_id": user as Any,
            "album_id": "wall",
            "access_token": apiKey,
            "v": version
        ]
        let url = baseUrl+request
        AF.request(url, method: .get, parameters:
                    parameters).responseData {repsonse in
                        guard let data = repsonse.value  else {return}
                        let photos = try! JSONDecoder().decode(Response.self, from: data)
                        completion(photos.response.items)
                    }
    }
}
