//
//  Participation.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 18.02.18.
//

import Foundation

public enum ApprovalStatus: String {
    case requested
    case accepted
    case denied
}

public final class Participation: Model {
    public var id: Int?
    public var userID: User.ID
    public var conversationID: Conversation.ID
    public var approvalStatus: String = ApprovalStatus.requested.rawValue
    public var joining: Date = Date()
    
    public init(userID: User.ID, conversationID: Conversation.ID) {
        self.userID = userID
        self.conversationID = conversationID
    }
}

public extension Participation {
    public func publicParticipant() -> PublicParticipant {
        return PublicParticipant(participant: self)
    }
    
    public struct PublicParticipant: Codable {
        public let userID: User.ID
        public let approvalStatus: String
        public let joining: Date
        
        public init(participant: Participation) {
            self.userID = participant.userID
            self.approvalStatus = participant.approvalStatus
            self.joining = participant.joining
        }
    }
}
