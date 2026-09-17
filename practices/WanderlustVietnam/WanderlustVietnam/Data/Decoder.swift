//
//  Decoder.swift
//  WanderlustVietnam
//
//  Created by Van Tai on 17/9/26.
//

import Foundation

var destinationData: [Destination] = decodeJSON(from: "data.json")

func decodeJSON(from fileName: String) -> [Destination] {
    if let file = Bundle.main.url(forResource: fileName, withExtension: nil){
        if let data = try? Data(contentsOf: file){
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Destination].self, from: data)
                return decoded
            } catch let error{
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(fileName) file")
    }
    
    return [ ] as [Destination]
}

