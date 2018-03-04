//
//  Privacy.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 14.02.18.
//

import Foundation

public final class Privacy: Codable {
    public var id: Int?
    public var userID: Int
    public var shareLocation = false
    public var showFirstName = true
    public var showLastName = false
    public var showBirth = false
    public var showSex = true
    public var showAddress = false
    public var showBiography = true
    
    public init(userID: Int) {
        self.userID = userID
    }
    
    public init(userID: Int, shareLocation: Bool, showFirstName: Bool, showLastName: Bool, showBirth: Bool, showSex: Bool, showAddress: Bool, showBiography: Bool) {
        self.userID = userID
        self.shareLocation = shareLocation
        self.showFirstName = showFirstName
        self.showLastName = showLastName
        self.showBirth = showBirth
        self.showSex = showSex
        self.showAddress = showAddress
        self.showBiography = showBiography
    }
    
    public convenience init(userID: Int, privacyRequest request: PrivacyRequest) {
        self.init(userID: userID, shareLocation: request.shareLocation, showFirstName: request.showFirstName, showLastName: request.showLastName, showBirth: request.showBirth, showSex: request.showSex, showAddress: request.showAddress, showBiography: request.showBiography)
    }
}

public extension Privacy {
    public func publicPrivacy() -> PublicPrivacy {
        return PublicPrivacy(privacy: self)
    }
    
    public struct PublicPrivacy: Codable {
        public let shareLocation: Bool
        public let showFirstName: Bool
        public let showLastName: Bool
        public let showBirth: Bool
        public let showSex: Bool
        public let showAddress: Bool
        public let showBiography: Bool
        
        public init(privacy: Privacy) {
            self.shareLocation = privacy.shareLocation
            self.showFirstName = privacy.showFirstName
            self.showLastName = privacy.showLastName
            self.showBirth = privacy.showBirth
            self.showSex = privacy.showSex
            self.showAddress = privacy.showAddress
            self.showBiography = privacy.showBiography
        }
    }
}
