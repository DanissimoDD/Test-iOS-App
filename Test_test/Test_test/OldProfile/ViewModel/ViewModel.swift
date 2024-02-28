//
//  ViewModel.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/22/24.
//

import Foundation


protocol ViewModelType {
    
    // OUTPUT
    
    var didLoadUserData: ((UserData) -> Void)? { get set }
    var onError: ((String) -> Void)? { get set }
    
    // Input
    
    func didLoad()
    func willLoad()
    func onFailure()
}

final class ViewModel {

    var didLoadUserData: ((UserData) -> Void)?
    var onError: ((String) -> Void)?
    
    private let userDataNetworkManager: UserDataNetworkManagerProtocol
    
    init(userDataNetworkManager: UserDataNetworkManagerProtocol) {
        self.userDataNetworkManager = userDataNetworkManager
    }
    
    private func loadUserData() {
        userDataNetworkManager.fetchUserData(
            onSuccess: { [weak self] userData in
                self?.didLoadUserData?(userData)
            },
            onFail: { [weak self] error in
                self?.onError?(error)
            }
        )
    }
}

extension ViewModel: ViewModelType {
    
    func didLoad(){
        loadUserData()
    }
    
    func willLoad(){
        
    }
    func onFailure(){
        
    }
}
