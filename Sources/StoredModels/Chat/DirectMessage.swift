//
//  DirectMessage.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 17.02.18.
//

import Foundation

public final class DirectMessage: StoredModel {
    public var id: Int?
    public var senderID: User.ID
    public var conversationID: Conversation.ID
    public var time: Date
    public var message: String
    
    public init(senderID: User.ID, conversationID: Conversation.ID, time: Date, message: String) {
        self.senderID = senderID
        self.conversationID = conversationID
        self.time = time
        self.message = message
    }
    
    public init(senderID: User.ID, conversationID: Conversation.ID, messageRequest: DirectMessageRequest) {
        self.senderID = senderID
        self.conversationID = conversationID
        self.time = messageRequest.time
        self.message = messageRequest.message
    }
}

public extension DirectMessage {
    public func publicDirectMessage() throws -> PublicDirectMessage {
        return try PublicDirectMessage(directMessage: self)
    }
    
    public struct PublicDirectMessage: Codable {
        public let id: DirectMessage.ID
        public let senderID: User.ID
        public let time: Date
        public let message: String
        
        public init(directMessage: DirectMessage) throws {
            guard let id = directMessage.id else {
                throw StoredModelError.missingID
            }
            
            self.id = id
            self.senderID = directMessage.senderID
            self.time = directMessage.time
            self.message = directMessage.message
        }
    }
}
