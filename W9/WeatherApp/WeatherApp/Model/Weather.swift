//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Van Tai on 28/8/26.
//

import Foundation

struct Weather: Codable {
    let name: String
    let country: String
    let temp: Float
    let humidity: Float
    let windspeed: Float
    let sunrise: Int
    let sunset: Int
}
