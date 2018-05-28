//
//  ConversationRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 18.02.18.
//

import Foundation

public struct ConversationRequest: Codable {
    public let title: String?
    public let recipients: [Int]
    
    public init(title: String?, recipients: [Int]) {
        self.title = title
        self.recipients = recipients
    }
}
