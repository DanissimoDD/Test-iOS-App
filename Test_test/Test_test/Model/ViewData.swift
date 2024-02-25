//
//  ViewData.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/22/24.
//

import Foundation

struct UserDataList {
    let results: [UserData]
}

extension UserDataList: Decodable{

}

class UserData: Decodable { // мб перенести подписку в экстеншн
    // Norm
    let gender: String?
    let email: String?
        
    // nestedNameContainer
    let first: String?
    let last: String?
    // nestedLocationContainer
    let city: String?
    let country: String?
    // nestedDoBContainer
    let age: Int?
    // nestedPictureContainer
    let large: String?
    // NestedLoginContainer
    let uuid: String?
    
    enum CodingKeys: String, CodingKey {
        case gender
        case name
        enum NameCodingKeys: String, CodingKey {
            case first
            case last
        }
        case location
        enum LocationCodingKeys: String, CodingKey {
            case city
            case country
        }
        case email
        case dob
        enum DateOfBirthCodingKeys: Int, CodingKey{
            case age
        }
        case picture
        enum PictureCodingKeys: String, CodingKey{
            case large
        }
        case login
        enum LoginCodingKeys: String, CodingKey{
            case uuid
        }
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.gender = try? container.decode(String.self, forKey: .gender)
        self.email = try? container.decode(String.self, forKey: .email)
        // nestedNameContainer
        let nameContainer = try container.nestedContainer(keyedBy: CodingKeys.NameCodingKeys.self, forKey: .name)
        self.first = try? nameContainer.decode(String.self, forKey: .first)
        self.last = try? nameContainer.decode(String.self, forKey: .last)
        // nestedLocationContainer
        let locationContainer = try container.nestedContainer(keyedBy: CodingKeys.LocationCodingKeys.self, forKey: .location)
        self.city = try? locationContainer.decode(String.self, forKey: .city)
        self.country = try? locationContainer.decode(String.self, forKey: .country)
        // nestedDoBContainer
        let dobContainer = try container.nestedContainer(keyedBy: CodingKeys.DateOfBirthCodingKeys.self, forKey: .dob)
        self.age = try? dobContainer.decode(Int.self, forKey: .age)
        // nestedPictureContainer
        let pictureContainer = try container.nestedContainer(keyedBy: CodingKeys.PictureCodingKeys.self, forKey: .picture)
        self.large = try? pictureContainer.decode(String.self, forKey: .large)
        // NestedLoginContainer
        let loginContainer = try container.nestedContainer(keyedBy: CodingKeys.LoginCodingKeys.self, forKey: .login)
        self.uuid = try? loginContainer.decode(String.self, forKey: .uuid)
    }
}
