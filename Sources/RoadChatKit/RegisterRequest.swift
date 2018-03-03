//
//  RegisterRequest.swift
//  App
//
//  Created by Niklas Sauer on 07.02.18.
//

import Foundation

struct RegisterRequest: Codable {
    public let email: String
    public let username: String
    public let password: String
}
