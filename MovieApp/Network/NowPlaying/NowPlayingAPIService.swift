//
//  NowPlayingAPIService.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
final class NowPlayingAPIService: NowPlayingUseCase {
    private let apiService = CoreAPIManager.instance
    func getTrendingMovie(
        timeInterval: String,
        completion: @escaping (NowPlayingDTO?, String?) -> Void?
    ) {
        apiService.request(
            type: NowPlayingDTO.self,
            url: NowPlayingHelper.all(timeInterval).endPoint,
            method: .GET
        ) { [weak self] result in
                guard let _ = self else {return}
                switch result {
                    case .success(let data):
                        completion(data, nil)
                    case .failure(let error):
                        completion(nil, error.localizedDescription)
                }
            }
    }
    
}
