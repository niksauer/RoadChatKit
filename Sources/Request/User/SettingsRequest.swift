//
//  SettingsRequest.swift
//  App
//
//  Created by Niklas Sauer on 11.02.18.
//

import Foundation

public struct SettingsRequest: Codable {
    public let communityRadius: Int
    public let trafficRadius: Int
    
    public init(communityRadius: Int, trafficRadius: Int) {
        self.communityRadius = communityRadius
        self.trafficRadius = trafficRadius
    }
}

