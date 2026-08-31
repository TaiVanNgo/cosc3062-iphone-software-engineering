//
//  WeatherViewmodel.swift
//  WeatherApp
//
//  Created by Van Tai on 28/8/26.
//


import Foundation
import Combine

// https://api.openweathermap.org/data/2.5/weather?q=ho%20chi%20minh&appid=YOUR_API_KEY&units=metric


@Observable
class WeatherViewmodel {
    private(set) var weather: Weather?
    private(set) var isLoading = false
    private(set) var errorMessage: String?
    
    private let weatherService = WeatherService(
        apiKey: "f7c26da665f4da01d1c6d503521eccbf"
    )
    
    func loadWeather(city: String) async{
        isLoading = true
        
        // everytime the function is finished, turn off the isLoading
        defer{
            isLoading = false
        }
        
        do{
            weather = try await weatherService.fetchWeather(city: city)
        } catch{
            weather = nil
            errorMessage = error.localizedDescription
        }
    }
    
}
