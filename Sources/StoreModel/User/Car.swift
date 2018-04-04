//
//  Car.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 13.02.18.
//

import Foundation

public final class Car: Model {
    public var id: Int?
    public var userID: User.ID
    public var manufacturer: String
    public var model: String
    public var production: Date
    public var performance: Int?
    public var color: Int?
    
    public init(userID: User.ID, manufacturer: String, model: String, production: Date, performance: Int?, color: Int?) {
        self.userID = userID
        self.manufacturer = manufacturer
        self.model = model
        self.production = production
        self.performance = performance
        self.color = color
    }
    
    public convenience init(userID: User.ID, carRequest request: CarRequest) {
        self.init(userID: userID, manufacturer: request.manufacturer, model: request.model, production: request.production, performance: request.performance, color: request.color)
    }
}

public extension Car {
    public func publicCar() throws -> PublicCar {
        return try PublicCar(car: self)
    }
    
    public struct PublicCar: Codable {
        public let id: Car.ID
        public let userID: User.ID
        public let manufacturer: String
        public let model: String
        public let production: Date
        public let performance: Int?
        public let color: Int?
        
        public init(car: Car) throws {
            guard let id = car.id else {
                throw ModelError.missingID
            }
            
            self.id = id
            self.userID = car.userID
            self.manufacturer = car.manufacturer
            self.model = car.model
            self.production = car.production
            self.performance = car.performance
            self.color = car.color
        }
    }
}
