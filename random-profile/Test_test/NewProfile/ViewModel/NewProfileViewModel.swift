//
//  NewProfileViewModel.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/27/24.
//

import Foundation

protocol NewProfileViewModelType {
    // Output
    
    var didLoadUserData: (() -> Void)? { get set }
    var onError: ((String) -> Void)? { get set }
    var sectionViewModels: [NewProfileSectionViewModel] { get set }
    
    // Input
    
    func didLoad()
    func willLoad()
    func onFailure()
}


class NewProfileViewModel {
    
    var didLoadUserData: (() -> Void)?
    var onError: ((String) -> Void)?
    var sectionViewModels: [NewProfileSectionViewModel] = []
    
    private let userDataNetworkManager: UserDataNetworkManagerProtocol
    private let mapper: UserDataMapperProtocol
//    private let userData: UserData?
    
    init(
        userDataNetworkManager: UserDataNetworkManager,
        mapper: UserDataMapperProtocol
    ) {
        self.userDataNetworkManager = userDataNetworkManager
        self.mapper = mapper
    }
    
    private func loadUserData(){
        userDataNetworkManager.fetchUserData() { [weak self] userData in
            self?.handleUserData(userData: userData)
        } onFail: { [weak self] error in
            self?.onError?(error)
        }
    }
    
    private func handleUserData(userData: UserData) {
        sectionViewModels = mapper.createSections(userData: userData)
        didLoadUserData?()
    }
}

extension NewProfileViewModel: NewProfileViewModelType {
    
    func didLoad(){
        loadUserData()
    }
    
    func willLoad(){
        
    }
    
    func onFailure(){
        
    }
}
