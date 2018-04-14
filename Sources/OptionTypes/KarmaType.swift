//
//  KarmaType.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 08.04.18.
//

import Foundation

public enum KarmaType: Int, Codable {
    case upvote = 1
    case neutral = 0
    case downvote = -1
    
    public static var allCases: [KarmaType] = [.upvote, .neutral, .downvote]
}
