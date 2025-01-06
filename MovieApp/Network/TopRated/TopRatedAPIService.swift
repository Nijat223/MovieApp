//
//  TopRatedAPIService.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
final class TopRatedAPIService: TopRatedUseCase {
    private let apiService = CoreAPIManager.instance
    func getTopRatedMovie(
        completion: @escaping (TopRatedDTO?, String?) -> Void?
    ) {
        apiService.request(
            type: TopRatedDTO.self,
            url: TopRatedHelper.TopRated.endPoint,
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
