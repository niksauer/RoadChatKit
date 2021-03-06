//
//  CommunityMessage.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 06.02.18.
//

import Foundation

public final class CommunityMessage: StoredModel {
    public var id: Int?
    public var senderID: User.ID
    public var locationID: Location.ID
    public var title: String
    public var time: Date
    public var message: String?
    
    public init(senderID: User.ID, locationID: Location.ID, title: String, time: Date, message: String?) {
        self.senderID = senderID
        self.locationID = locationID
        self.title = title
        self.time = time
        self.message = message
    }
    
    public convenience init(senderID: User.ID, locationID: Location.ID, communityRequest: CommunityMessageRequest) {
        self.init(senderID: senderID, locationID: locationID, title: communityRequest.title, time: communityRequest.time, message: communityRequest.message)
    }
}

public extension CommunityMessage {
    public func publicCommunityMessage(upvotes: Int, karma: KarmaType, location: Location) throws -> PublicCommunityMessage {
        return try PublicCommunityMessage(communityMessage: self, upvotes: upvotes, karma: karma, location: location)
    }
    
    public struct PublicCommunityMessage: Codable {
        public let id: CommunityMessage.ID
        public let senderID: User.ID
        public let title: String
        public let time: Date
        public let message: String?
        public let upvotes: Int
        public let karma: KarmaType
        public let location: Location.PublicLocation
        
        public init(communityMessage: CommunityMessage, upvotes: Int, karma: KarmaType, location: Location) throws {
            guard let id = communityMessage.id else {
                throw StoredModelError.missingID
            }
            
            self.id = id
            self.senderID = communityMessage.senderID
            self.title = communityMessage.title
            self.time = communityMessage.time
            self.message = communityMessage.message
            self.upvotes = upvotes
            self.karma = karma
            self.location = location.publicLocation()
        }
    }
}
