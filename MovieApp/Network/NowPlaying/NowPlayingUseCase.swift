//
//  NowPlayingUseCase.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
protocol NowPlayingUseCase {
    func getTrendingMovie(timeInterval: String, completion: @escaping(NowPlayingDTO?, String?) -> Void?)
}
