//
//  Token.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 05.02.18.
//

import Foundation

public final class Token: Codable {
    public var id: Int?
    public var userID: Int
    public var token: String
    
    public init(userID: Int, token: String) {
        self.userID = userID
        self.token = token
    }
}

public extension Token {
    public func publicToken() -> PublicToken {
        return PublicToken(token: self)
    }
    
    public struct PublicToken: Codable {
        public let token: String
        
        public init(token: Token) {
            self.token = token.token
        }
    }
}
