//
//  SexType.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 10.04.18.
//

import Foundation

public enum SexType: String, Codable {
    case male, female, other
    
    public static var allCases: [SexType] = [.male, .female, .other]
}
