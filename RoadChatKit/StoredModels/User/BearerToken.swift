//
//  BearerToken.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 05.02.18.
//

import Foundation

public final class BearerToken: StoredModel {
    public var id: Int?
    public var userID: User.ID
    public var token: String
    
    public init(userID: Int, token: String) {
        self.userID = userID
        self.token = token
    }
}

public extension BearerToken {
    public func publicToken() -> PublicBearerToken {
        return PublicBearerToken(token: self)
    }
    
    public struct PublicBearerToken: Codable {
        public let userID: Int
        public let token: String
        
        public init(token: BearerToken) {
            self.userID = token.userID
            self.token = token.token
        }
    }
}
