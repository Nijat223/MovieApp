//
//  TopRatedUseCase.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
protocol TopRatedUseCase {
    func getTopRatedMovie(completion: @escaping(TopRatedDTO?, String?) -> Void?)
}
