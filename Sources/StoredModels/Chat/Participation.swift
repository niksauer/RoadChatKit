//
//  Participation.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 18.02.18.
//

import Foundation

public final class Participation: StoredModel {
    public var id: Int?
    public var userID: User.ID
    public var conversationID: Conversation.ID
    public var status: ApprovalType.RawValue
    public var joining: Date = Date()
    
    public init(userID: User.ID, conversationID: Conversation.ID) {
        self.userID = userID
        self.conversationID = conversationID
        self.status = ApprovalType.requested.rawValue
    }
    
    public init(userID: User.ID, conversationID: Conversation.ID, approval: ApprovalType) {
        self.userID = userID
        self.conversationID = conversationID
        self.status = approval.rawValue
    }
}

public extension Participation {
    public func publicParticipant() -> PublicParticipant {
        return PublicParticipant(participation: self)
    }
    
    public struct PublicParticipant: Codable {
        public let userID: User.ID
        public let approval: ApprovalType
        public let joining: Date
        
        public init(participation: Participation) {
            self.userID = participation.userID
            self.approval = ApprovalType(rawValue: participation.status)!
            self.joining = participation.joining
        }
    }
}
