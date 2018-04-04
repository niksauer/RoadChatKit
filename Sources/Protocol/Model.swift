//
//  Model.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 04.03.18.
//

import Foundation

enum ModelError: Error {
    case missingID
}

public protocol Model: Codable {
    associatedtype ID
    var id: ID? { get }
}
