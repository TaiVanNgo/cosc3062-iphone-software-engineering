//
//  ModelData.swift
//  ContactListJSON
//
//  Created by Van Tai on 16/9/26.
//

import Foundation

var contacts: [Contact] = decodeJSON(from: "contacts.json")

func decodeContacts(from fileName: String) -> [Contact] {
    if let file = Bundle.main.url(forResource: fileName, withExtension: nil){
        if let data = try? Data(contentsOf: file){
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Contact].self, from: data)
                return decoded
            } catch let error{
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(fileName) file")
    }
    
    return [ ] as [Contact]
}


func decodeJSON<T: Decodable>(from filename: String) -> T {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    let data: Data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
