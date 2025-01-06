//
//  PopularAPIService.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
final class PopularAPIService: PopularUseCase {
    private let apiService = CoreAPIManager.instance
    func getPopularMovie(
        completion: @escaping (PopularDTO?, String?) -> Void?
    ) {
        apiService.request(
            type: PopularDTO.self,
            url: PopularHelper.popular.endPoint,
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
