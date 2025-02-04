//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 27.12.24.
//

import Foundation
final class HomeViewModel {
    enum ViewState {
        case loading
        case loaded
        case successTranding
        case error(String)
    }
    
    enum TimeInterval: String {
        case day, week
    }
    
    private var trendingUse: TrendingUseCase
    var type: TimeInterval = .day {
        didSet {
            getMovieList()
        }
    }
    private (set) var movieDto: MovieDTO?
    
    var requestCallBack: ((ViewState) -> Void)?
    init() {
        trendingUse = TrendingAPIService()
    }
    
    //MARK: Tranding
    
    func getTrandingCount() -> Int {
        movieDto?.results?.count ?? 0
    }
    
    func getTrandingMovie(index: Int) -> MovieResult? {
        return movieDto?.results?[index]
    }
    
    private func getMovieList() {
        requestCallBack?(.loading)
        trendingUse.getTrendingMovie(
            timeInterval: type.rawValue) { [weak self] dto, error in
                guard let self = self else {return}
                requestCallBack?(.loaded)
                if let dto = dto {
                    movieDto = dto
                    requestCallBack?(.successTranding)
                } else if let error = error {
                    requestCallBack?(.error(error))
                }
            }
    }
}
