//
//  ModelData.swift
//  SSETContactList
//
//  Created by Van Tai on 18/7/26.
//

import Foundation
import MapKit

var contacts = decodeJson(fileName: "contacts.json")


func decodeJson(fileName: String) -> [Contact] {
    if let file = Bundle.main.url(forResource: fileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file){
            do{
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Contact].self, from: data)
                return decoded
            } catch let error{
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else{
        fatalError("Couldn't load \(fileName) file")
    }
    
    return [ ] as [Contact]
}
