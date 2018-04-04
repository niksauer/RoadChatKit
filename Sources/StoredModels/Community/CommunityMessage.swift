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
    public var time: Date
    public var message: String
    
    public init(senderID: User.ID, locationID: Location.ID, time: Date, message: String) {
        self.senderID = senderID
        self.locationID = locationID
        self.time = time
        self.message = message
    }
    
    public convenience init(senderID: User.ID, locationID: Location.ID, communityRequest: CommunityMessageRequest) {
        self.init(senderID: senderID, locationID: locationID, time: communityRequest.time, message: communityRequest.message)
    }
}

public extension CommunityMessage {
    public struct PublicCommunityMessage: Codable {
        public let id: CommunityMessage.ID
        public let senderID: User.ID
        public let locationID: Location.ID
        public let time: Date
        public let message: String
        public let upvotes: Int
        
        public init(communityMessage: CommunityMessage, upvotes: Int) throws {
            guard let id = communityMessage.id else {
                throw StoredModelError.missingID
            }
            
            self.id = id
            self.senderID = communityMessage.senderID
            self.locationID = communityMessage.locationID
            self.time = communityMessage.time
            self.message = communityMessage.message
            self.upvotes = upvotes
        }
    }
}
