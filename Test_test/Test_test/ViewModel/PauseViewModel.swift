//
//  PauseViewModel.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/25/24.
//

import Foundation

protocol PauseViewModelType {
    
    // OUTPUT
    
//    var didLoadUserData: ((UserData) -> Void)? { get set }
//    var onError: ((String) -> Void)? { get set }
    
    // Input
    
    func didLoad()
    func willLoad()
    func onFailure()
}


class PauseViewModel {
    
    init(){
        
    }
}

extension PauseViewModel: PauseViewModelType {
    
    func didLoad(){
        
    }
    
    func willLoad(){
        
    }
    
    func onFailure(){
        
    }
}
