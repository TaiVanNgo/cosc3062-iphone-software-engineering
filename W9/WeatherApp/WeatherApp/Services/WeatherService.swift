//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Van Tai on 31/8/26.
//
// api URL: https://api.openweathermap.org/data/2.5/weather?q=ho%20chi%20minh&appid=f7c26da665f4da01d1c6d503521eccbf&units=metric

import Foundation

enum WeatherServiceError: LocalizedError {
    case invalidURL
    case invalidResponse
    case serverError(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Could not create the weather URL."
        case .invalidResponse:
            return "OpenWeather returned an invalid response"
        case .serverError(let status):
            return "Openweather request failed with status \(status)"
        }
    }
}

struct WeatherService {
    let apiKey: String
    
    func fetchWeather(city: String) async throws -> Weather {
        var components = URLComponents(
            string: "https://api.openweathermap.org/data/2.5/weather"
        )
        
        // build the queries
        components?.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: "metric")
        ]

        guard let url = components?.url else {
            throw WeatherServiceError.invalidURL
        }
                
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw WeatherServiceError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else{
            throw WeatherServiceError.serverError(httpResponse.statusCode)
        }
        
        let res = try JSONDecoder().decode(
            OpenWeatherResponse.self,
            from: data
        )
        
        print("res", res)
        
        return Weather(
            name: res.name,
            country: res.sys.country,
            temp: res.main.temp,
            humidity: res.main.humidity,
            windspeed: res.wind.speed,
            sunrise: res.sys.sunrise,
            sunset: res.sys.sunset
        )
    }
}
