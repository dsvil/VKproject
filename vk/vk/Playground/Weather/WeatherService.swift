//
//  WeatherService.swift
//  vk
//
//  Created by Sergei Dorozhkin on 16.12.2020.
//

import Foundation
import Alamofire

//let weatherService = WeatherService()
//weatherService.loadWeatherData(city: "Moscow")

class WeatherService {
    // базовый URL сервиса
    let baseUrl = "http://api.openweathermap.org"
    // ключ для доступа к сервису
    let apiKey = "92cabe9523da26194b02974bfcd50b7e"
    // метод для загрузки данных, в качестве аргументов получает город
    func loadWeatherData(city: String){
        // путь для получения погоды за 5 дней
        let path = "/data/2.5/forecast"
        // параметры, город, единицы измерения градусы, ключ для доступа к сервису
        let parameters: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey
        ]
        // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl+path
        // делаем запрос
        AF.request(url, method: .get, parameters:
                    parameters).responseJSON { repsonse in
                        print(repsonse.value as Any)
                    }
    }
    
    // Работа со сторонним Url с использованием классических инструментов в Xcode
    func oldSchool() {
        // Конфигурация по умолчанию
                let configuration = URLSessionConfiguration.default
        // собственная сессия
                let session =  URLSession(configuration: configuration)
        // создаем конструктор для URL
                var urlConstructor = URLComponents()
        // устанавливаем схему
                urlConstructor.scheme = "http"
        // устанавливаем хост
                urlConstructor.host = "samples.openweathermap.org"
        // путь
                urlConstructor.path = "/data/2.5/forecast"
        // параметры для запроса
                urlConstructor.queryItems = [
                    URLQueryItem(name: "q", value: "München,DE"),
                    URLQueryItem(name: "appid", value:  "b1b15e88fa797225412429c1c50c122a1")
        ]
        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
        // в замыкании данные, полученные от сервера, мы преобразуем в json
                    let json = try? JSONSerialization.jsonObject(with: data!, options:
        JSONSerialization.ReadingOptions.allowFragments)
        // выводим в консоль
            print(json as Any)
                }
        // запускаем задачу
                task.resume()
    }
}

