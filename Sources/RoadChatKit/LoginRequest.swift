//
//  LoginRequest.swift
//  App
//
//  Created by Niklas Sauer on 06.02.18.
//

import Foundation

struct LoginRequest: Codable {
    public let user: String
    public let password: String
}
