//
//  Location.swift
//  RoadChatKit
//
//  Created by Phillip Rust on 21.02.18.
//

import Foundation

public final class Location: StoredModel {
    public var id: Int?
    public var timestamp: Date
    public var latitude: Double
    public var longitude: Double
    public var altitude: Double
    public var horizontalAccuracy: Double
    public var verticalAccuracy: Double
    public var course: Double
    public var speed: Double
    
    public init(timestamp: Date, latitude: Double, longitude: Double, altitude: Double, horizontalAccuracy: Double, verticalAccuracy: Double, course: Double, speed: Double) {
        self.timestamp = timestamp
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.horizontalAccuracy = horizontalAccuracy
        self.verticalAccuracy = verticalAccuracy
        self.course = course
        self.speed = speed
    }
    
    public convenience init(locationRequest request: LocationRequest) {
        self.init(timestamp: request.time, latitude: request.latitude, longitude: request.longitude, altitude: request.altitude, horizontalAccuracy: request.horizontalAccuracy, verticalAccuracy: request.verticalAccuracy, course: request.course, speed: request.speed)
    }
    
    public convenience init(trafficMessageRequest request: TrafficMessageRequest) {
        self.init(timestamp: request.time, latitude: request.latitude, longitude: request.longitude, altitude: request.altitude, horizontalAccuracy: request.horizontalAccuracy, verticalAccuracy: request.verticalAccuracy, course: request.course, speed: request.speed)
    }
    
    public convenience init(communityMessageRequest request: CommunityMessageRequest) {
        self.init(timestamp: request.time, latitude: request.latitude, longitude: request.longitude, altitude: request.altitude, horizontalAccuracy: request.horizontalAccuracy, verticalAccuracy: request.verticalAccuracy, course: request.course, speed: request.speed)
    }
}

public extension Location {
    public func publicLocation() -> PublicLocation {
        return PublicLocation(location: self)
    }
    
    public struct PublicLocation: Codable {
        public let timestamp: Date
        public let latitude: Double
        public let longitude: Double
        public let altitude: Double
        public let horizontalAccuracy: Double
        public let verticalAccuracy: Double
        public let course: Double
        public let speed: Double
        
        public init(location: Location) {
            self.timestamp = location.timestamp
            self.latitude = location.latitude
            self.longitude = location.longitude
            self.altitude = location.altitude
            self.horizontalAccuracy = location.horizontalAccuracy
            self.verticalAccuracy = location.verticalAccuracy
            self.course = location.course
            self.speed = location.speed
        }
    }
}
