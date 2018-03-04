//
//  RegisterRequest.swift
//  App
//
//  Created by Niklas Sauer on 07.02.18.
//

import Foundation

public struct RegisterRequest: Codable {
    public let email: String
    public let username: String
    public let password: String
    
    public init(email: String, username: String, password: String) {
        self.email = email
        self.username = username
        self.password = password
    }
}
