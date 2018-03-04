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

public final class Participation: Codable {
    public var id: Int?
    public var userID: Int
    public var conversationID: Int
    public var approvalStatus: String = ApprovalStatus.requested.rawValue
    public var joining: Date = Date()
    
    public init(userID: Int, conversationID: Int) {
        self.userID = userID
        self.conversationID = conversationID
    }
}

public extension Participation {
    public func publicParticipant() -> PublicParticipant {
        return PublicParticipant(participant: self)
    }
    
    public struct PublicParticipant: Codable {
        public let userID: Int
        public let approvalStatus: String
        public let joining: Date
        
        public init(participant: Participation) {
            self.userID = participant.userID
            self.approvalStatus = participant.approvalStatus
            self.joining = participant.joining
        }
    }
}
