//
//  Image.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 23.05.18.
//

import Foundation

public struct PublicImage: Codable {
    public let filename: String
    public let data: Data
    
    public init(filename: String, data: Data) {
        self.filename = filename
        self.data = data
    }
}
