//
//  PrivacyRequest.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 14.02.18.
//

import Foundation

public struct PrivacyRequest: Codable {
    public let shareLocation: Bool
    public let showFirstName: Bool
    public let showLastName: Bool
    public let showBirth: Bool
    public let showSex: Bool
    public let showAddress: Bool
    public let showBiography: Bool
    
    public init(shareLocation: Bool, showFirstName: Bool, showLastName: Bool, showBirth: Bool, showSex: Bool, showAddress: Bool, showBiography: Bool) {
        self.shareLocation = shareLocation
        self.showFirstName = showFirstName
        self.showLastName = showLastName
        self.showBirth = showBirth
        self.showSex = showSex
        self.showAddress = showAddress
        self.showBiography = showBiography
    }
}
