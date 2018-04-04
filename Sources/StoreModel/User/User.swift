//
//  User.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 05.02.18.
//

import Foundation

public final class User: Model {
    public var id: Int?
    public var locationID: Location.ID?
    public var email: String
    public var username: String
    public var password: String
    public var registry: Date = Date()
    
    public init(email: String, username: String, password: String) {
        self.email = email
        self.username = username
        self.password = password
    }
    
    public convenience init(registerRequest request: RegisterRequest) {
        self.init(email: request.email, username: request.username, password: request.password)
    }
}

public extension User {
    public func publicUser(isOwner: Bool) throws -> PublicUser {
        return try PublicUser(user: self, isOwner: isOwner)
    }
    
    public func publicUser(location: Location) throws -> PublicUser {
        return try PublicUser(user: self, location: location)
    }
    
    public struct PublicUser: Codable {
        public let id: User.ID
        public var email: String?
        public let username: String
        public let registry: Date
        
        public var timestamp: Date?
        public var latitude: Double?
        public var longitude: Double?
        public var altitude: Double?
        public var horizontalAccuracy: Double?
        public var verticalAccuracy: Double?
        public var course: Double?
        public var speed: Double?
        
        public init(user: User, isOwner: Bool) throws {
            guard let id = user.id else {
                throw ModelError.missingID
            }
            
            self.id = id
            
            if isOwner {
                self.email = user.email
            }
            
            self.username = user.username
            self.registry = user.registry
        }
        
        public init(user: User, location: Location) throws {
            try self.init(user: user, isOwner: false)
            
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
