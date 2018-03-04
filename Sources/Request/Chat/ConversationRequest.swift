//
//  ConversationRequest.swift
//  App
//
//  Created by Niklas Sauer on 18.02.18.
//

import Foundation

public struct ConversationRequest: Codable {
    public let title: String
    public let participants: [Int]
    
    public init(title: String, participants: [Int]) {
        self.title = title
        self.participants = participants
    }
}