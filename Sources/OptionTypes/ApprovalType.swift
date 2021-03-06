//
//  ApprovalType.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 10.04.18.
//

import Foundation

public enum ApprovalType: String, Codable {
    case requested
    case accepted
    case denied
    case deleted
    
    public static var allCases: [ApprovalType] = [.requested, .accepted, .denied, .deleted]
}
