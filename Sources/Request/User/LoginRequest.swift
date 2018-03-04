//
//  LoginRequest.swift
//  App
//
//  Created by Niklas Sauer on 06.02.18.
//

import Foundation

public struct LoginRequest: Codable {
    public let user: String
    public let password: String
    
    public init(user: String, password: String) {
        self.user = user
        self.password = password
    }
}
