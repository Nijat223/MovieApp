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
    private var movieDetail: MovieDetail
    init(navigation: HomeNavigation,
         movieDetail: MovieDetail
    ) {
        self.navigation = navigation
        self.movieDetail = movieDetail
    }
    
    func getDetail() -> MovieDetail {
        movieDetail
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
        navigation?.showTrailer(url: "https://www.youtube.com/watch?v=JdSl4RMNtGE&t=3s")
    }

    
}
