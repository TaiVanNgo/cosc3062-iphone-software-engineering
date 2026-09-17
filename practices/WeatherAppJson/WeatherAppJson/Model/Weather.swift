//
//  Weather.swift
//  WeatherAppJson
//
//  Created by Van Tai on 17/9/26.
//

import Foundation

struct Weather: Codable {
    let id: String
    let cityName: String
    let countryCode: String
    let temperature: Double
    let humidity: Int
    let windSpeed: Double
    let sunrise: String
    let sunset: String
}
