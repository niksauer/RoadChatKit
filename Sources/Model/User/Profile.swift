//
//  Profile.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 12.02.18.
//

import Foundation

public final class Profile: Codable {
    public var id: Int?
    public var userID: Int
    public var firstName: String
    public var lastName: String
    public var birth: Date
    public var sex: String?
    public var biography: String?
    public var streetName: String?
    public var streetNumber: Int?
    public var postalCode: Int?
    public var country: String?
    
    
    public init(userID: Int, firstName: String, lastName: String, birth: Date, sex: String?, biography: String?, streetName: String?, streetNumber: Int?, postalCode: Int?, country: String?) {
        self.userID = userID
        self.firstName = firstName
        self.lastName = lastName
        self.birth = birth
        self.sex = sex
        self.biography = biography
        self.streetName = streetName
        self.streetNumber = streetNumber
        self.postalCode = postalCode
        self.country = country
    }
    
    public convenience init(userID: Int, profileRequest request: ProfileRequest) {
        self.init(userID: userID, firstName: request.firstName, lastName: request.lastName, birth: request.birth, sex: request.sex, biography: request.biography, streetName: request.streetName, streetNumber: request.streetNumber, postalCode: request.postalCode, country: request.country)
    }
}

public extension Profile {
    public func publicProfile(privacy: Privacy, isOwner: Bool) -> PublicProfile {
        return PublicProfile(profile: self, privacy: privacy, isOwner: isOwner)
    }
    
    public struct PublicProfile: Codable {
        public var firstName: String?
        public var lastName: String?
        public var birth: Date?
        public var sex: String?
        public var biography: String?
        public var streetName: String?
        public var streetNumber: Int?
        public var postalCode: Int?
        public var country: String?
        
        public init(profile: Profile, privacy: Privacy, isOwner: Bool) {
            if isOwner {
                self.firstName = profile.firstName
                self.lastName = profile.lastName
                self.birth = profile.birth
                self.sex = profile.sex
                self.biography = profile.biography
                self.streetName = profile.streetName
                self.streetNumber = profile.streetNumber
                self.postalCode = profile.postalCode
                self.country = profile.country
            } else {
                if privacy.showFirstName {
                    self.firstName = profile.firstName
                }
                
                if privacy.showLastName {
                    self.lastName = profile.lastName
                } else if let firstCharacter = profile.lastName.first {
                    self.lastName = "\(firstCharacter)."
                }
                
                if privacy.showBirth {
                    self.birth = profile.birth
                }
                
                if privacy.showSex {
                    self.sex = profile.sex
                }
                
                self.biography = profile.biography
                
                if privacy.showAddress {
                    self.streetName = profile.streetName
                    self.streetNumber = profile.streetNumber
                    self.postalCode = profile.postalCode
                    self.country = profile.country
                }
            }
        }
    }
}
