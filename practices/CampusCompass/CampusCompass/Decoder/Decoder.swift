//
//  Decoder.swift
//  CampusCompass
//
//  Created by Van Tai on 18/9/26.
//

import Foundation

var spotsData: [Spot] = decode(from: "spots.json")

func decode(from fileName: String) -> [Spot] {
    if let file = Bundle.main.url(forResource: fileName, withExtension: nil){
        if let data = try? Data(contentsOf: file){
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Spot].self, from: data)
                return decoded
            } catch let error{
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(fileName) file")
    }
    
    return [ ] as [Spot]
}
