//
//  NewProfileRegularSectionViewModel.swift
//  Test_test
//
//  Created by Thanos Cynric on 3/1/24.
//

import Foundation

struct NewProfileRegularSectionViewModel {
    let headerViewModel: NewProfileRegularSectionHeaderViewModel
    
    let ageGender: NewProfileFieldDataCellViewModel?
    let location: NewProfileFieldDataCellViewModel?
    
    let aboutMe: NewProfileFieldAboutUserDataCellViewModel
}

struct NewProfileRegularSectionHeaderViewModel {
    let title: String
}

struct NewProfileFieldDataCellViewModel {
    enum CellType {
        case age
        case location
    }
    
    let type: CellType
    let title: String
    let subtitle: String
}

struct NewProfileFieldAboutUserDataCellViewModel {
    let title: String
    let text: String
}
