//
//  TrafficMessageRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 13.02.18.
//

import Foundation

public enum TrafficType: String {
    case jam, accident, danger, detour
}

public struct TrafficMessageRequest: Codable {
    public let type: String
    public let time: Date
    public let message: String?
    
    public let latitude: Double
    public let longitude: Double
    public let altitude: Double
    public let horizontalAccuracy: Double
    public let verticalAccuracy: Double
    public let course: Double
    public let speed: Double
    
    public init(type: TrafficType, time: Date, message: String?, latitude: Double, longitude: Double, altitude: Double, horizontalAccuracy: Double, verticalAccuracy: Double, course: Double, speed: Double) {
        self.type = type.rawValue
        self.time = time
        self.message = message
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.horizontalAccuracy = horizontalAccuracy
        self.verticalAccuracy = verticalAccuracy
        self.course = course
        self.speed = speed
    }
}
