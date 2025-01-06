//
//  UpcomingAPIService.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
final class UpcomingAPIService: UpcomingUseCase {
    private let apiService = CoreAPIManager.instance
    func getUpcomingMovie(
        completion: @escaping (UpcomingDTO?, String?) -> Void?
    ) {
        apiService.request(
            type: UpcomingDTO.self,
            url: UpcomingHelper.Upcoming.endPoint,
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
