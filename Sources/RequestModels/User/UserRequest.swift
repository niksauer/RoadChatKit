//
//  UserRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 18.04.18.
//

import Foundation

public struct UserRequest: Codable {
    public let email: String?
    public let username: String?
    
    public init(email: String?, username: String?) {
        self.email = email
        self.username = username
    }
}
