//
//  PopularHelper.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
enum PopularHelper {
    case popular
    
    private var mainPath: String {
        return "movie/popular"
    }
    var endPoint: URL? {
        switch self {
            case .popular: return CoreAPIHelper.instance.makeURL(path: mainPath)
        }
    }
}
