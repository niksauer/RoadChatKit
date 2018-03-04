//
//  CarRequest.swift
//  App
//
//  Created by Niklas Sauer on 13.02.18.
//

import Foundation

public struct CarRequest: Codable {
    public let manufacturer: String
    public let model: String
    public let production: Date
    public let performance: Int?
    public let color: Int?
    
    public init(manufacturer: String, model: String, production: Date, performance: Int?, color: Int?) {
        self.manufacturer = manufacturer
        self.model = model
        self.production = production
        self.performance = performance
        self.color = color
    }
}
