//
//  FriendsPhotos.swift
//  vk
//
//  Created by Sergei Dorozhkin on 18.12.2020.
//

import Foundation
import Alamofire
class ApiGetPhotosVK {
    
    let baseUrl = "https://api.vk.com/method/"
    let version = "5.126"
    func getData(user:Int?){
        let request = "photos.get"
        guard let apiKey = Session.instance.token else {return}
        let parameters: Parameters = [
            "owner_id": user as Any,
            "album_id": "profile",
            "extended": 1,
            "access_token": apiKey,
            "v": version
        ]
        let url = baseUrl+request
        AF.request(url, method: .get, parameters:
                    parameters).responseJSON { repsonse in
                        print(repsonse.value!)
                    }
    }
}
