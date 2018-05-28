//
//  CommunityMessageRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 08.02.18.
//

import Foundation

public struct CommunityMessageRequest: Codable {
    public let title: String
    public let time: Date
    public let message: String?
    public let location: Location
    
    public init(title: String, time: Date, message: String?, location: Location) {
        self.title = title
        self.time = time
        self.message = message
        self.location = location
    }
}
