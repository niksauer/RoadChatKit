//
//  ConversationRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 18.02.18.
//

import Foundation

public struct ConversationRequest: Codable {
    public let title: String?
    public let participants: [Int]
    
    public init(title: String?, participants: [Int]) {
        self.title = title
        self.participants = participants
    }
}

public struct ConversationUpdateRequest: Codable {
    public let title: String?
    
    public init(title: String?) {
        self.title = title
    }
}
