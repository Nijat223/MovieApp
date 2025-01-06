//
//  NowPlayingUseCase.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
protocol NowPlayingUseCase {
    func getNowPlayingMovie(completion: @escaping(NowPlayingDTO?, String?) -> Void?)
}
