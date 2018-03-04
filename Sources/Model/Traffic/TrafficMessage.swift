//
//  TrafficMessage.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 13.02.18.
//

import Foundation

public final class TrafficMessage: Codable {
    public var id: Int?
    public var senderID: Int
    public var locationID: Int
    public var type: String
    public var time: Date
    public var message: String?
    
    public init(senderID: Int, locationID: Int, type: String, time: Date, message: String?) {
        self.senderID = senderID
        self.locationID = locationID
        self.type = type
        self.time = time
        self.message = message
    }
    
    public convenience init(senderID: Int, locationID: Int, trafficRequest: TrafficMessageRequest) {
        self.init(senderID: senderID, locationID: locationID, type: trafficRequest.type, time: trafficRequest.time, message: trafficRequest.message)
    }
}

public extension TrafficMessage {
    public struct PublicTrafficMessage: Codable {
        public var id: Int
        public var senderID: Int
        public var locationID: Int
        public var type: String
        public var time: Date
        public var message: String?
        public var validations: Int
        public var upvotes: Int
        
        public init(trafficMessage: TrafficMessage, upvotes: Int, validations: Int) throws {
            guard let id = trafficMessage.id else {
                throw ModelError.missingID
            }
            
            self.id = id
            self.senderID = trafficMessage.senderID
            self.locationID = trafficMessage.locationID
            self.type = trafficMessage.type
            self.time = trafficMessage.time
            self.message = trafficMessage.message
            self.upvotes = upvotes
            self.validations = validations
        }
    }
}
