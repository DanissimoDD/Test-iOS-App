//
//  ProfileMainPictureCellViewModel.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/28/24.
//

import Foundation


final class ProfileMainPictureCellViewModel {
    
    let pictureURL: URL?
    let userName: String?
    let phoneNumber: String?
    let emailAdderss: String?
    
    init(userData: UserData){
        userName = userData.first // покачто только first
        phoneNumber = "+7(952)662-88-06"
        emailAdderss = userData.email
        pictureURL = URL(string: "https://randomuser.me/api/portraits/men/75.jpg")
//        pictureURL = makePictureURL(userData.large ?? "")
    }
    
//    private func makePictureURL(_ path: String) -> URL? {
//        URL(string: "\(path)")
//    }
    
}
