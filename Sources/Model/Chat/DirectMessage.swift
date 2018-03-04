//
//  DirectMessage.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 17.02.18.
//

import Foundation

public final class DirectMessage: Codable {
    public var id: Int?
    public var senderID: Int
    public var conversationID: Int
    public var time: Date
    public var message: String
    
    public init(senderID: Int, conversationID: Int, time: Date, message: String) {
        self.senderID = senderID
        self.conversationID = conversationID
        self.time = time
        self.message = message
    }
    
    public init(senderID: Int, conversationID: Int, messageRequest: DirectMessageRequest) {
        self.senderID = senderID
        self.conversationID = conversationID
        self.time = messageRequest.time
        self.message = messageRequest.message
    }
}

public extension DirectMessage {
    public func publicDirectMessage() throws -> PublicDirectMessage {
        return PublicDirectMessage(directMessage: self)
    }
    
    public struct PublicDirectMessage: Codable {
        public let senderID: Int
        public let time: Date
        public let message: String
        
        public init(directMessage: DirectMessage) {
            self.senderID = directMessage.senderID
            self.time = directMessage.time
            self.message = directMessage.message
        }
    }
}

