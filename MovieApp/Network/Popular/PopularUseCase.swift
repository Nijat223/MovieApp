//
//  PopularUseCase.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
protocol PopularUseCase {
    func getPopularMovie(completion: @escaping(PopularDTO?, String?) -> Void?)
}
