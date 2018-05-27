//
//  Settings.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 11.02.18.
//

import Foundation 

public final class Settings: StoredModel {
    public var id: Int?
    public var userID: User.ID
    public var communityRadius: Int = 10
    public var trafficRadius: Int = 5
    
    public init(userID: User.ID) {
        self.userID = userID
    }
    
    public init(userID: User.ID, communityRadius: Int, trafficRadius: Int) {
        self.userID = userID
        self.communityRadius = communityRadius
        self.trafficRadius = trafficRadius
    }
    
    public convenience init(userID: User.ID, settingsRequest request: SettingsRequest) {
        self.init(userID: userID, communityRadius: request.communityRadius, trafficRadius: request.trafficRadius)
    }
}

public extension Settings {
    public func publicSettings() -> PublicSettings {
        return PublicSettings(settings: self)
    }
    
    public struct PublicSettings: Codable {
        public let communityRadius: Int
        public let trafficRadius: Int
        
        public init(settings: Settings) {
            self.communityRadius = settings.communityRadius
            self.trafficRadius = settings.trafficRadius
        }
    }
}
