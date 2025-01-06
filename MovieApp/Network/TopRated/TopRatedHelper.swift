//
//  TopRatedHelper.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
enum TopRatedHelper {
    case TopRated
    
    private var mainPath: String {
        return "movie/top_rated"
    }
    var endPoint: URL? {
        switch self {
            case .TopRated: return CoreAPIHelper.instance.makeURL(path: mainPath)
        }
    }
}
