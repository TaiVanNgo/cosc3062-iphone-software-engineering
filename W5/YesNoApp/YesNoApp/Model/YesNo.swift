//
//  YesNo.swift
//  YesNoApp
//
//  Created by Van Tai on 24/7/26.
//

import Foundation

struct YesNo: Decodable, Sendable {
    let answer: String
    let forced: Bool
    let image: URL
}
