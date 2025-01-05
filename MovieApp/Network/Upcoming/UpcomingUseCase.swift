//
//  UpcomingUseCase.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
protocol UpcomingUseCase {
    func getTrendingMovie(timeInterval: String, completion: @escaping(UpcomingDTO?, String?) -> Void?)
}
