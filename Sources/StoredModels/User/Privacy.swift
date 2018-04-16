//
//  Privacy.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 14.02.18.
//

import Foundation

public final class Privacy: StoredModel {
    public var id: Int?
    public var userID: User.ID
    public var shareLocation = false
    public var showEmail = false
    public var showFirstName = true
    public var showLastName = false
    public var showBirth = false
    public var showSex = true
    public var showBiography = true
    public var showStreet = false
    public var showCity = true
    public var showCountry = true
    
    public init(userID: User.ID) {
        self.userID = userID
    }
    
    public init(userID: User.ID, shareLocation: Bool, showEmail: Bool, showFirstName: Bool, showLastName: Bool, showBirth: Bool, showSex: Bool, showBiography: Bool, showStreet: Bool, showCity: Bool, showCountry: Bool) {
        self.userID = userID
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
    
    public convenience init(userID: User.ID, privacyRequest request: PrivacyRequest) {
        self.init(userID: userID, shareLocation: request.shareLocation, showEmail: request.showEmail, showFirstName: request.showFirstName, showLastName: request.showLastName, showBirth: request.showBirth, showSex: request.showSex, showBiography: request.showBiography, showStreet: request.showStreet, showCity: request.showCity, showCountry: request.showCountry)
    }
}

public extension Privacy {
    public func publicPrivacy() -> PublicPrivacy {
        return PublicPrivacy(privacy: self)
    }
    
    public struct PublicPrivacy: Codable {
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
        
        public init(privacy: Privacy) {
            self.shareLocation = privacy.shareLocation
            self.showEmail = privacy.showEmail
            self.showFirstName = privacy.showFirstName
            self.showLastName = privacy.showLastName
            self.showBirth = privacy.showBirth
            self.showSex = privacy.showSex
            self.showBiography = privacy.showBiography
            self.showStreet = privacy.showStreet
            self.showCity = privacy.showCity
            self.showCountry = privacy.showCountry
        }
    }
}
