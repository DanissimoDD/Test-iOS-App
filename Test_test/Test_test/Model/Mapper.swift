//
//  Mapper.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/29/24.
//

import Foundation

protocol UserDataMapperProtocol {
    func createSections(userData: UserData) -> [NewProfileSectionViewModel]
    // другие секции
}

struct UserDataMapper {
    
    private let regularSectionHeader = "My details"
    
    private let titleFieldAgeGenderDataCell = "Age/Gender:"
    
    private let titleFieldLocationDataCell = "Country/City:"
    
    private let titleFieldAboutMeDataCell = "About me:"
    private let textFieldAboutMeDataCell = "not indicated"
    
    private func createTopCellViewModel(userData: UserData) -> NewProfileTopCellViewModel{
        NewProfileTopCellViewModel(
            name: "\(userData.first ?? "") \(userData.last ?? "")",
            phoneNumber: "\(userData.phone ?? "")",
            emailAddress: "\(userData.email ?? "")",
            profileImageURL: URL(string: userData.large ?? "")
        )
    }
    
    private func createMainSectionViewModel(userData: UserData) -> NewProfileMainSectionViewModel{
        NewProfileMainSectionViewModel(
            topCellViewModel: createTopCellViewModel(userData: userData)
        )
    }
    
    private func createMainSection(userData: UserData) -> NewProfileSectionViewModel {
        NewProfileSectionViewModel(
            numberOfRows: 1,
            sectionType: .mainData,
            mainDataSection: createMainSectionViewModel(userData: userData),
            regularDataSection: nil
        )
    }

    private func createNewProfileRegularSectionHeaderViewModel()
    -> NewProfileRegularSectionHeaderViewModel {
        NewProfileRegularSectionHeaderViewModel(title: regularSectionHeader)
    }
    
    private func createFieldAgeGenderDataCellViewModel(userData: UserData)
    -> NewProfileFieldDataCellViewModel {// сделать с еджами что-то красиво
        let ageGenderSubtitel = "\(userData.age ?? 0) y.o. / \(userData.gender ?? "")"
        return NewProfileFieldDataCellViewModel(
            type: .age,
            title: titleFieldAgeGenderDataCell,
            subtitle: ageGenderSubtitel)
    }
    
    private func createFieldLocationDataCellViewModel(userData: UserData)
    -> NewProfileFieldDataCellViewModel {
        let locationSubtitle = "\(userData.country ?? ""), \(userData.city ?? "")"
        return NewProfileFieldDataCellViewModel(
            type: .location,
            title: titleFieldLocationDataCell,
            subtitle: locationSubtitle)
    }
    
    private func createFieldAboutUserDataCellViewModel(userData: UserData)
    -> NewProfileFieldAboutUserDataCellViewModel {
        return NewProfileFieldAboutUserDataCellViewModel(
            title: titleFieldAboutMeDataCell,
            text: textFieldAboutMeDataCell
        )
    }
    
    private func createRegularSectionViewModel(userData: UserData)
    -> NewProfileRegularSectionViewModel {
        NewProfileRegularSectionViewModel(
            headerViewModel: createNewProfileRegularSectionHeaderViewModel(),
            ageGender: createFieldAgeGenderDataCellViewModel(userData: userData),
            location: createFieldLocationDataCellViewModel(userData: userData),
            aboutMe: createFieldAboutUserDataCellViewModel(userData: userData)
            )
    }
    
    private func createRegularSection(userData: UserData) -> NewProfileSectionViewModel {
        NewProfileSectionViewModel(
            numberOfRows: 3, // header не включается в секции
            sectionType: .regularData,
            mainDataSection: nil,
            regularDataSection: createRegularSectionViewModel(userData: userData)
        )
    }
}

extension UserDataMapper: UserDataMapperProtocol {
    
    func createSections(userData: UserData) -> [NewProfileSectionViewModel] {
        var sections = [NewProfileSectionViewModel]()
        sections.append(createMainSection(userData: userData))
        sections.append(createRegularSection(userData: userData)) // надо тут сделать
        return sections
    }
}
