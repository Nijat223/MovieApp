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
        case success
        case error(String)
    }
    
    enum TimeInterval: String {
        case day, week
    }
    
    private var trendingUse: TrendingUseCase
    private var popularUse: PopularUseCase

    var type: TimeInterval = .day {
        didSet {
            getMovieList()
        }
    }
    private (set) var movieDto: MovieDTO?
    private (set) var popularDTO: PopularDTO?

    
    var requestCallBack: ((ViewState) -> Void)?
    init() {
        trendingUse = TrendingAPIService()
        popularUse = PopularAPIService()
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
                    requestCallBack?(.success)
                } else if let error = error {
                    requestCallBack?(.error(error))
                }
            }
    }
    
    //MARK: Popular
    
    func getPopularCount() -> Int {
        popularDTO?.results.count ?? 0
    }
    
    func getPopularPrint(){
        print(#function, popularDTO?.results.count ?? 22)
    }
    func getPopularMovies(index: Int) -> PopularResult? {
        return popularDTO?.results[index]    }
    
    
    func getPopularList() {
        requestCallBack?(.loading)
        popularUse.getPopularMovie() { [weak self] dto, error in
                guard let self = self else {return}
                requestCallBack?(.loaded)
                if let dto = dto {
                    popularDTO = dto
                    requestCallBack?(.success)
                } else if let error = error {
                    requestCallBack?(.error(error))
                }
            }
    }
}
