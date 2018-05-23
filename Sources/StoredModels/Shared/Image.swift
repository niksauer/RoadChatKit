//
//  Image.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 23.05.18.
//

import Foundation

public struct Image: Codable {
    public struct PublicImage: Codable {
        let filename: String
        let data: Data
        
        public init(filename: String, data: Data) {
            self.filename = filename
            self.data = data
        }
    }
}
