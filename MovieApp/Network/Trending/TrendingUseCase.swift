//
//  TrendingUseCase.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 30.12.24.
//

import Foundation
protocol TrendingUseCase {
    func getTrendingMovie(timeInterval: String, completion: @escaping(MovieDTO?, String?) -> Void?)
}
