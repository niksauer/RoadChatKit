//
//  TrafficMessageRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 13.02.18.
//

import Foundation

public struct TrafficMessageRequest: Codable {
    public let type: TrafficType.RawValue
    public let time: Date
    public let message: String?
    public let location: Location
    
    public init(type: TrafficType, time: Date, message: String?, location: Location) {
        self.type = type.rawValue
        self.time = time
        self.message = message
        self.location = location
    }
}
