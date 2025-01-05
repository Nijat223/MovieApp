//
//  TopRatedHelper.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
enum TopRatedHelper {
    case all(String)
    
    private var mainPath: String {
        return "top_rated/"
    }
    var endPoint: URL? {
        switch self {
            case .all(let query): return CoreAPIHelper.instance.makeURL(path:"\(mainPath)all/\(query)")
        }
    }
}
