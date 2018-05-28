//
//  ConversationUpdateRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 28.05.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation

public struct ConversationUpdateRequest: Codable {
    public let title: String?
    
    public init(title: String?) {
        self.title = title
    }
}
