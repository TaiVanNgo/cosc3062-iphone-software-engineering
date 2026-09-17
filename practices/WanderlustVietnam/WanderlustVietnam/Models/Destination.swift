//
//  Destination.swift
//  WanderlustVietnam
//
//  Created by Van Tai on 17/9/26.
//

import Foundation

struct Destination: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let province: String
    let headline: String
    let description: String
    let imageName: String
    let galleryImages: [String]
}

