//
//  CommunityMessage.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 06.02.18.
//

import Foundation

public final class CommunityMessage: Codable {
    public var id: Int?
    public var senderID: Int
    public var locationID: Int
    public var time: Date
    public var message: String
    
    public init(senderID: Int, locationID: Int, time: Date, message: String) {
        self.senderID = senderID
        self.locationID = locationID
        self.time = time
        self.message = message
    }
    
    public convenience init(senderID: Int, locationID: Int, communityRequest: CommunityMessageRequest) {
        self.init(senderID: senderID, locationID: locationID, time: communityRequest.time, message: communityRequest.message)
    }
}

public extension CommunityMessage {
    public struct PublicCommunityMessage: Codable {
        public let id: Int
        public let senderID: Int
        public let locationID: Int
        public let time: Date
        public let message: String
        public let upvotes: Int
        
        public init(communityMessage: CommunityMessage, upvotes: Int) throws {
            guard let id = communityMessage.id else {
                throw ModelError.missingID
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
