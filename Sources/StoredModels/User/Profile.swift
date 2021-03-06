//
//  Profile.swift
//  RoadChatKit
//
//  Created by Niklas Sauer on 12.02.18.
//

import Foundation

public final class Profile: StoredModel {
    public var id: Int?
    public var userID: User.ID
    public var firstName: String
    public var lastName: String
    public var birth: Date
    public var sex: SexType.RawValue?
    public var biography: String?
    public var streetName: String?
    public var streetNumber: Int?
    public var postalCode: Int?
    public var city: String?
    public var country: String?
    public var photoURL: URL?
    
    public init(userID: User.ID, firstName: String, lastName: String, birth: Date, sex: SexType?, biography: String?, streetName: String?, streetNumber: Int?, postalCode: Int?, city: String?, country: String?, profilePhotoURL: URL?) {
        self.userID = userID
        self.firstName = firstName
        self.lastName = lastName
        self.birth = birth
        self.sex = sex?.rawValue
        self.biography = biography
        self.streetName = streetName
        self.streetNumber = streetNumber
        self.postalCode = postalCode
        self.city = city
        self.country = country
        self.photoURL = profilePhotoURL
    }
    
    public convenience init(userID: User.ID, profileRequest request: ProfileRequest) throws {
        let sex: SexType?
    
        if let requestedSex = request.sex {
            guard let sexType = SexType(rawValue: requestedSex) else {
                throw RequestError.invalidSexType
            }
            
            sex = sexType
        } else {
            sex = nil
        }
        
        self.init(userID: userID, firstName: request.firstName, lastName: request.lastName, birth: request.birth, sex: sex, biography: request.biography, streetName: request.streetName, streetNumber: request.streetNumber, postalCode: request.postalCode, city: request.city, country: request.country, profilePhotoURL: nil)
    }
}

public extension Profile {
    public func publicProfile(privacy: Privacy, isOwner: Bool) -> PublicProfile {
        return PublicProfile(profile: self, privacy: privacy, isOwner: isOwner)
    }
    
    public struct PublicProfile: Codable {
        public let firstName: String?
        public let lastName: String?
        public let birth: Date?
        public let sex: SexType?
        public let biography: String?
        public let streetName: String?
        public let streetNumber: Int?
        public let postalCode: Int?
        public let city: String?
        public let country: String?
        public let photoURL: URL?
        
        public init(profile: Profile, privacy: Privacy, isOwner: Bool) {
            if privacy.showFirstName || isOwner {
                self.firstName = profile.firstName
            } else {
                self.firstName = nil
            }
            
            if privacy.showLastName || isOwner {
                self.lastName = profile.lastName
            } else if let firstCharacter = profile.lastName.first {
                self.lastName = "\(firstCharacter)."
            } else {
                self.lastName = nil
            }
            
            if privacy.showBirth || isOwner {
                self.birth = profile.birth
            } else {
                self.birth = nil
            }
            
            if let sex = profile.sex, privacy.showSex || isOwner {
                self.sex = SexType(rawValue: sex)!
            } else {
                self.sex = nil
            }
            
            if privacy.showBiography || isOwner {
                self.biography = profile.biography
            } else {
                self.biography = nil
            }
            
            if privacy.showStreet || isOwner {
                self.streetName = profile.streetName
                self.streetNumber = profile.streetNumber
            } else {
                self.streetName = nil
                self.streetNumber = nil
            }
            
            if privacy.showCity || isOwner {
                self.postalCode = profile.postalCode
                self.city = profile.city
            } else {
                self.postalCode = nil
                self.city = nil
            }
            
            if privacy.showCountry || isOwner {
                self.country = profile.country
            } else {
                self.country = nil
            }
            
            self.photoURL = profile.photoURL
        }
    }
}
