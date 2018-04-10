//
//  ProfileRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 12.02.18.
//

import Foundation

public struct ProfileRequest: Codable {
    public let firstName: String
    public let lastName: String
    public let birth: Date
    public let sex: SexType.RawValue?
    public let biography: String?
    public let streetName: String?
    public let streetNumber: Int?
    public let postalCode: Int?
    public let country: String?
    
    public init(firstName: String, lastName: String, birth: Date, sex: SexType?, biography: String?, streetName: String?, streetNumber: Int?, postalCode: Int?, country: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.birth = birth
        self.sex = sex?.rawValue
        self.biography = biography
        self.streetName = streetName
        self.streetNumber = streetNumber
        self.postalCode = postalCode
        self.country = country
    }
    
}
