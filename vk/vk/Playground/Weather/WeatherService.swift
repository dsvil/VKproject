//
//  WeatherService.swift
//  vk
//
//  Created by Sergei Dorozhkin on 16.12.2020.
//

import Foundation
import Alamofire

class WeatherResponse: Decodable {
    let list: [Weather]
}
class Weather: Decodable {
dynamic var date = 0.0
dynamic var temp = 0.0
dynamic var pressure = 0.0
dynamic var humidity = 0
dynamic var weatherName = ""
dynamic var weatherIcon = ""
dynamic var windSpeed = 0.0
dynamic var windDegrees = 0.0
dynamic var city = ""
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main
        case weather
        case wind
    }
    enum MainKeys: String, CodingKey {
        case temp
        case pressure
        case humidity
    }
    enum WeatherKeys: String, CodingKey {
        case main
        case icon }
    enum WindKeys: String, CodingKey {
        case speed
        case deg }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try values.decode(Double.self, forKey: .date)
        let mainValues = try values.nestedContainer(keyedBy: MainKeys.self, forKey: .main)
        self.temp = try mainValues.decode(Double.self, forKey: .temp)
        self.pressure = try mainValues.decode(Double.self, forKey: .pressure)
        self.humidity = try mainValues.decode(Int.self, forKey: .humidity)
        var weatherValues = try values.nestedUnkeyedContainer(forKey:.weather)
        let firstWeatherValues = try weatherValues.nestedContainer(keyedBy: WeatherKeys.self)
        self.weatherName = try firstWeatherValues.decode(String.self, forKey: .main)
        self.weatherIcon = try firstWeatherValues.decode(String.self, forKey: .icon)
        let windValues = try values.nestedContainer(keyedBy: WindKeys.self, forKey: .wind)
        self.windSpeed = try windValues.decode(Double.self, forKey: .speed)
        self.windDegrees = try windValues.decode(Double.self, forKey: .deg)
    }
}

class WeatherService {
    let baseUrl = "http://api.openweathermap.org"
    let apiKey = "92cabe9523da26194b02974bfcd50b7e"
    func loadWeatherData(city: String, completion: @escaping ([Weather]) -> Void ){
        let path = "/data/2.5/forecast"
        let parameters: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey
        ]
        let url = baseUrl+path
        
        AF.request(url,   method:   .get,   parameters:
                    parameters).responseData { repsonse in
                        guard let data = repsonse.value else { return }
                        let weather = try! JSONDecoder().decode(WeatherResponse.self, from:data).list
                        completion(weather)
                    }
    }
}


