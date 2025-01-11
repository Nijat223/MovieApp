//
//  UpcomingUseCase.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
protocol UpcomingUseCase {
    func getUpcomingMovie(completion: @escaping(UpcomingDTO?, String?) -> Void?)
}

