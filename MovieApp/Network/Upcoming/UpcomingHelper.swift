//
//  UpcomingHelper.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
enum UpcomingHelper {
    case Upcoming
    
    private var mainPath: String {
        return "movie/upcoming"
    }
    var endPoint: URL? {
        switch self {
        case .Upcoming: return CoreAPIHelper.instance.makeURL(path: mainPath)
        }
    }
    
}
