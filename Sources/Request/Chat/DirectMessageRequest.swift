//
//  DirectMessageRequest.swift
//  App
//
//  Created by Niklas Sauer on 19.02.18.
//

import Foundation

public struct DirectMessageRequest: Codable {
    public let time: Date
    public let message: String
    
    public init(time: Date, message: String) {
        self.time = time
        self.message = message
    }
}
