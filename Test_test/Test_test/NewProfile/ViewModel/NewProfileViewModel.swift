//
//  NewProfileViewModel.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/27/24.
//

import Foundation


class NewProfileViewModel {
    
    var didLoadUserData: ((UserData) -> Void)?
    var onError: ((String) -> Void)?
    
    private let userDataNetworkManager: UserDataNetworkManagerProtocol
    
    init(userDataNetworkManager: UserDataNetworkManager){
        self.userDataNetworkManager = userDataNetworkManager
    }
    
    private func loadUserData(){
        userDataNetworkManager.fetchUserData(){ [weak self] userData in
            self?.didLoadUserData?(userData)
        } onFail: { [weak self] error in
            self?.onError?(error)
        }
    }
    
}

extension NewProfileViewModel: ViewModelType {
    
    func didLoad(){
        loadUserData()
    }
    
    func willLoad(){
        
    }
    
    func onFailure(){
        
    }
}
