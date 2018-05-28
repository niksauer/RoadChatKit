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

public extension SexType {
    public init?(secondRawValue: Int) {
        switch secondRawValue {
        case 0:
            self = .male
        case 1:
            self = .female
        case 2:
            self = .other
        default:
            return nil
        }
    }
    
    public var secondRawValue: Int {
        switch self {
        case .male:
            return 0
        case .female:
            return 1
        case .other:
            return 2
        }
    }
}
