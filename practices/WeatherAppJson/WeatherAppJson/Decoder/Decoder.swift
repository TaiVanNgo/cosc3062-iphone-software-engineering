//
//  Decoder.swift
//  WeatherAppJson
//
//  Created by Van Tai on 17/9/26.
//

import Foundation

var weatherData: [Weather] = decode(from: "data.json")

func decode(from fileName: String) -> [Weather] {
    if let file = Bundle.main.url(forResource: fileName, withExtension: nil){
        if let data = try? Data(contentsOf: file){
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Weather].self, from: data)
                return decoded
            } catch let error{
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(fileName) file")
    }
    
    return [ ] as [Weather]
}
