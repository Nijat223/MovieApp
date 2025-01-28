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
    private var nowplayingUse: NowPlayingUseCase
    private var topratedUse: TopRatedUseCase
    private var upcomingUse: UpcomingUseCase



    var type: TimeInterval = .day {
        didSet {
            getMovieList()
        }
    }
    private (set) var movieDto: MovieDTO?
    private (set) var popularDTO: PopularDTO?
    private (set) var nowplayingDTO: NowPlayingDTO?
    private (set) var topratedDTO: TopRatedDTO?
    private (set) var upcomingDTO: UpcomingDTO?


    
    var requestCallBack: ((ViewState) -> Void)?
    init() {
        trendingUse = TrendingAPIService()
        popularUse = PopularAPIService()
        nowplayingUse = NowPlayingAPIService()
        topratedUse = TopRatedAPIService()
        upcomingUse = UpcomingAPIService()


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
    
    //MARK: NowPlaying
    
    func getNowPlayingCount() -> Int {
        nowplayingDTO?.results.count ?? 0
    }
    
    func getNowPlayingPrint(){
        print(#function, nowplayingDTO?.results.count ?? 22)
    }
    func getNowPlayingMovies(index: Int) -> NowPlayingResult? {
        return nowplayingDTO?.results[index]    }
    
    
    func getNowPlayingList() {
        requestCallBack?(.loading)
        nowplayingUse.getNowPlayingMovie() { [weak self] dto, error in
                guard let self = self else {return}
                requestCallBack?(.loaded)
                if let dto = dto {
                    nowplayingDTO = dto
                    requestCallBack?(.success)
                } else if let error = error {
                    requestCallBack?(.error(error))
                }
            }
    }
    
    //MARK: TopRated
    
    func getTopRatedCount() -> Int {
        topratedDTO?.results.count ?? 0
    }
    
    func getTopRatedPrint(){
        print(#function, topratedDTO?.results.count ?? 22)
    }
    func getTopRatedMovies(index: Int) -> TopRatedResult? {
        return topratedDTO?.results[index]    }
    
    
    func getTopRatedList() {
        requestCallBack?(.loading)
        topratedUse.getTopRatedMovie() { [weak self] dto, error in
                guard let self = self else {return}
                requestCallBack?(.loaded)
                if let dto = dto {
                    topratedDTO = dto
                    requestCallBack?(.success)
                } else if let error = error {
                    requestCallBack?(.error(error))
                }
            }
    }
    
    //MARK: Upcoming
    
    func getUpcomingCount() -> Int {
        upcomingDTO?.results.count ?? 0
    }
    
    func getUpcomingPrint(){
        print(#function, upcomingDTO?.results.count ?? 22)
    }
    func getUpcomingMovies(index: Int) -> UpcomingResult? {
        return upcomingDTO?.results[index]    }
    
    
    func getUpcomingList() {
        requestCallBack?(.loading)
        upcomingUse.getUpcomingMovie() { [weak self] dto, error in
                guard let self = self else {return}
                requestCallBack?(.loaded)
                if let dto = dto {
                    upcomingDTO = dto
                    requestCallBack?(.success)
                } else if let error = error {
                    requestCallBack?(.error(error))
                }
            }
    }
}
