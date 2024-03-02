//
//  NewProfileSectionViewModel.swift
//  Test_test
//
//  Created by Thanos Cynric on 3/1/24.
//

import Foundation

protocol SectionViewModel {
    var numberOfRows: Int { get }
}

struct NewProfileSectionViewModel: SectionViewModel {
    let numberOfRows: Int
    let sectionType: NewProfileSectionItemType
    let mainDataSection: NewProfileMainSectionViewModel?
    let regularDataSection: NewProfileRegularSectionViewModel?
}

enum NewProfileSectionItemType {
    case mainData
    case regularData
}
