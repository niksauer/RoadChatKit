//
//  LocationRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 25.02.18.
//

import Foundation

public struct LocationRequest: Codable {
    public let time: Date
    public let latitude: Double
    public let longitude: Double
    public let altitude: Double
    public let horizontalAccuracy: Double
    public let verticalAccuracy: Double
    public let course: Double
    public let speed: Double
    
    public init(time: Date, latitude: Double, longitude: Double, altitude: Double, horizontalAccuracy: Double, verticalAccuracy: Double, course: Double, speed: Double) {
        self.time = time
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.horizontalAccuracy = horizontalAccuracy
        self.verticalAccuracy = verticalAccuracy
        self.course = course
        self.speed = speed
    }
}
