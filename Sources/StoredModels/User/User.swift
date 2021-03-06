//
//  User.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 05.02.18.
//

import Foundation

public final class User: StoredModel {
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
}

public extension User {
    public func publicUser(isOwner: Bool, privacy: Privacy.PublicPrivacy, location: Location?) throws -> PublicUser {
        return try PublicUser(user: self, isOwner: isOwner, privacy: privacy, location: location)
    }
    
    public struct PublicUser: Codable {
        public let id: User.ID
        public let email: String?
        public let username: String
        public let registry: Date
        public let privacy: Privacy.PublicPrivacy
        public let location: Location.PublicLocation?
        
        public init(user: User, isOwner: Bool, privacy: Privacy.PublicPrivacy, location: Location?) throws {
            guard let id = user.id else {
                throw StoredModelError.missingID
            }
            
            self.id = id
            self.email = isOwner ? user.email : nil
            self.username = user.username
            self.registry = user.registry
            self.privacy = privacy
            self.location = location?.publicLocation()
        }
    }
}
