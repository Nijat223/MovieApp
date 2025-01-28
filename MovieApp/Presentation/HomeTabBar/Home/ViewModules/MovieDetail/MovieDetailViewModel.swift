//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 27.01.25.
//

import Foundation

final class MovieDetailViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
    }
    
    private weak var navigation: HomeNavigation?
    
    var requestCallBack: ((ViewState) -> Void)?
    
    init(navigation: HomeNavigation) {
        self.navigation = navigation
    }
    
    func request() {
//        requestCallBack?(.loading)
//        requestCallBack?(.loaded)
//        requestCallBack?(.error(error.localizedDescription))
//        requestCallBack?(.success)
//        
    }
    
    
    //MARK: Coordinator
    
    func showTrailer() {
    }

    
}
