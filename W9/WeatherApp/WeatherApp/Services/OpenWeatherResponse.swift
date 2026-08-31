//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Van Tai on 28/8/26.
//

import Foundation

struct OpenWeatherResponse: Decodable {
    let name: String
    let main: WeatherMain
    let wind: WeatherWind
    let sys: WeatherSys
}

struct WeatherMain: Decodable {
    let temp: Float
    let humidity: Float
}

struct WeatherWind: Decodable {
    let speed: Float
}

struct WeatherSys: Decodable {
    let country: String
    let sunrise: Int
    let sunset: Int
}


