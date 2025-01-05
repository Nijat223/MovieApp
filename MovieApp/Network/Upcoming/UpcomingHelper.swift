//
//  UpcomingHelper.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
enum UpcomingHelper {
    case all(String)
    
    private var mainPath: String {
        return "upcoming/"
    }
    var endPoint: URL? {
        switch self {
            case .all(let query): return CoreAPIHelper.instance.makeURL(path:"\(mainPath)all/\(query)")
        }
    }
}
