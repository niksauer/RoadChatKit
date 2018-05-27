//
//  PrivacyRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 14.02.18.
//

import Foundation

public struct PrivacyRequest: Codable {
    public let shareLocation: Bool
    public let showEmail: Bool
    public let showFirstName: Bool
    public let showLastName: Bool
    public let showBirth: Bool
    public let showSex: Bool
    public let showBiography: Bool
    public let showStreet: Bool
    public let showCity: Bool
    public let showCountry: Bool
    
    public init(shareLocation: Bool, showEmail: Bool, showFirstName: Bool, showLastName: Bool, showBirth: Bool, showSex: Bool, showBiography: Bool, showStreet: Bool, showCity: Bool, showCountry: Bool) {
        self.shareLocation = shareLocation
        self.showEmail = showEmail
        self.showFirstName = showFirstName
        self.showLastName = showLastName
        self.showBirth = showBirth
        self.showSex = showSex
        self.showBiography = showBiography
        self.showStreet = showStreet
        self.showCity = showCity
        self.showCountry = showCountry
    }
}
