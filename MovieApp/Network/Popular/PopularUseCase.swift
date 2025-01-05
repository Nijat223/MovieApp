//
//  PopularUseCase.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
protocol PopularUseCase {
    func getTrendingMovie(timeInterval: String, completion: @escaping(PopularDTO?, String?) -> Void?)
}
