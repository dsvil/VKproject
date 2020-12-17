//
//  API VK.swift
//  vk
//
//  Created by Sergei Dorozhkin on 17.12.2020.
//

import Foundation
import Alamofire

class ApiGetFriendsVK {
    
    let baseUrl = "https://api.vk.com/method/"
    let apiKey = Session.instance.token
    let user = Session.instance.userId
    let version = "5.126"
    func getData(fields: String?){
        let request = "friends.get"
        let parameters: Parameters = [
            "user_ids": user!,
            "fields": fields as Any,
            "access_token": apiKey!,
            "v": version
        ]
        let url = baseUrl+request
        AF.request(url, parameters:
                    parameters).responseJSON { repsonse in
                        print(repsonse.value!)
                    }
    }
}

class ApiGetGroupsVK {
    
    let baseUrl = "https://api.vk.com/method/"
    let apiKey = Session.instance.token
    let user = Session.instance.userId
    let version = "5.126"
    func getData(fields: String?){
        let request = "groups.get"
        let parameters: Parameters = [
            "user_ids": user!,
            "extended": 1,
            "fields": fields as Any,
            "access_token": apiKey!,
            "v": version
        ]
        let url = baseUrl+request
        AF.request(url, parameters:
                    parameters).responseJSON { repsonse in
                        print(repsonse.value!)
                    }
    }
}

class ApiGetPhotosVK {
    
    let baseUrl = "https://api.vk.com/method/"
    let apiKey = Session.instance.token
    let user = Session.instance.userId
    let version = "5.126"
    func getData(){
        let request = "photos.get"
        let parameters: Parameters = [
            "owner_id": user!,
            "album_id": "profile",
            "extended": 1,
            "access_token": apiKey!,
            "v": version
        ]
        let url = baseUrl+request
        AF.request(url, parameters:
                    parameters).responseJSON { repsonse in
                        print(repsonse.value!)
                    }
    }
}

class ApiGetGroupsVKSearch {
    
    let baseUrl = "https://api.vk.com/method/"
    let apiKey = Session.instance.token
    let version = "5.126"
    func getData(searchText: String){
        let request = "groups.search"
        let parameters: Parameters = [
            "q": searchText,
            "type": "group",
            "sort": 0,
            "access_token": apiKey!,
            "v": version
        ]
        let url = baseUrl+request
        AF.request(url, parameters:
                    parameters).responseJSON { repsonse in
                        print(repsonse.value!)
                    }
    }
}
