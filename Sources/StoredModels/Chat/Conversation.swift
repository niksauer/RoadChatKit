//
//  Conversation.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 17.02.18.
//

import Foundation

public final class Conversation: StoredModel {
    public var id: Int?
    public var creatorID: User.ID
    public var title: String
    public var creation: Date = Date()
    
    public init(creatorID: User.ID, title: String) {
        self.creatorID = creatorID
        self.title = title
    }
}

public extension Conversation {
    public func publicConversation(newestMessage: DirectMessage?) throws -> PublicConversation {
        return try PublicConversation(conversation: self, newestMessage: newestMessage)
    }
    
    public struct PublicConversation: Codable {
        public let id: Conversation.ID
        public let creatorID: User.ID
        public let title: String
        public let creation: Date
        public let newestMessage: DirectMessage.PublicDirectMessage?
        
        public init(conversation: Conversation, newestMessage: DirectMessage?) throws {
            guard let id = conversation.id else {
                throw StoredModelError.missingID
            }
            
            self.id = id
            self.creatorID = conversation.creatorID
            self.title = conversation.title
            self.creation = conversation.creation
            self.newestMessage = try newestMessage?.publicDirectMessage()
        }
    }
}