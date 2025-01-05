//
//  LoginViewModel.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation

final class LoginViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error
    }
    
    private weak var navigation: AuthNavigation?
    
    var requestCallBack: ((ViewState) -> Void)?
    
    init(navigation: AuthNavigation) {
        self.navigation = navigation
    }
}
