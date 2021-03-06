//
//  StoredModel.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 04.03.18.
//

import Foundation

public protocol StoredModel: Codable {
    associatedtype ID
    var id: ID? { get }
}
