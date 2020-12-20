//
//  TestWeatherStuff.swift
//  vk
//
//  Created by Sergei Dorozhkin on 20.12.2020.
//

import UIKit

class TestWeatherStuff: UIViewController {
    
    let configuration = URLSessionConfiguration.default
    var weather = [Weather]()
    
    func loadWeatherData(completion: @escaping ([Weather]) -> Void ){
        
        let session = URLSession.init(configuration: configuration)
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "http"
        urlConstructor.host = "samples.openweathermap.org"
        urlConstructor.path = "/data/2.5/forecast"
        urlConstructor.queryItems = [
            URLQueryItem(name: "q", value: "Moscow,DE"),
            URLQueryItem(name: "appid", value: "75e51e4b38d0e0e90c644cfcec4b8f68")
        ]
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
//                        let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
//                        print(json as Any)
            let weather = try! JSONDecoder().decode(WeatherResponse.self, from: data)
            completion(weather.list)
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWeatherData { [weak self](data) in
            self?.weather = data
            print(self?.weather as Any)
        }
    }
}
