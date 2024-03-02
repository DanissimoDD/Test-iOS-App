//
//  NewProfileMainSectionViewModel.swift
//  Test_test
//
//  Created by Thanos Cynric on 3/1/24.
//

import Foundation

struct NewProfileMainSectionViewModel {
    let topCellViewModel: NewProfileTopCellViewModel?
}

struct NewProfileTopCellViewModel {
    let name: String
    let phoneNumber: String
    let emailAddress: String?
    let profileImageURL: URL?
}
