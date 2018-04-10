//
//  TrafficMessage.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 13.02.18.
//

import Foundation

public final class TrafficMessage: StoredModel {
    public var id: Int?
    public var senderID: User.ID
    public var locationID: Location.ID
    public var type: TrafficType
    public var time: Date
    public var message: String?
    
    public init(senderID: User.ID, locationID: User.ID, type: TrafficType, time: Date, message: String?) {
        self.senderID = senderID
        self.locationID = locationID
        self.type = type
        self.time = time
        self.message = message
    }
    
    public convenience init(senderID: User.ID, locationID: Location.ID, trafficRequest: TrafficMessageRequest) {
        self.init(senderID: senderID, locationID: locationID, type: trafficRequest.type, time: trafficRequest.time, message: trafficRequest.message)
    }
}

public extension TrafficMessage {
    public func publicTrafficMessage(validations: Int, upvotes: Int, karma: KarmaType) throws -> PublicTrafficMessage {
        return try PublicTrafficMessage(trafficMessage: self, upvotes: upvotes, validations: validations, karma: karma)
    }
    
    public struct PublicTrafficMessage: Codable {
        public let id: TrafficMessage.ID
        public let senderID: User.ID
        public let locationID: Location.ID
        public let type: TrafficType
        public let time: Date
        public let message: String?
        public let validations: Int
        public let upvotes: Int
        public let karma: KarmaType
        
        public init(trafficMessage: TrafficMessage, upvotes: Int, validations: Int, karma: KarmaType) throws {
            guard let id = trafficMessage.id else {
                throw StoredModelError.missingID
            }
            
            self.id = id
            self.senderID = trafficMessage.senderID
            self.locationID = trafficMessage.locationID
            self.type = trafficMessage.type
            self.time = trafficMessage.time
            self.message = trafficMessage.message
            self.upvotes = upvotes
            self.validations = validations
            self.karma = karma
        }
    }
}
