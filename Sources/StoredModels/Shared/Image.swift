//
//  Image.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 23.05.18.
//

import Foundation

struct Image: Codable {
    struct PublicImage: Codable {
        let filename: String
        let data: Data
    }
}
