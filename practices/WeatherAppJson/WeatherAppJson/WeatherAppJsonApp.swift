//
//  WeatherAppJsonApp.swift
//  WeatherAppJson
//
//  Created by Van Tai on 17/9/26.
//

import SwiftUI

@main
struct WeatherAppJsonApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(weatherData: weatherData)
        }
    }
}
