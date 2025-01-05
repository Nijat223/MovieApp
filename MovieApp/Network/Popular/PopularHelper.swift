//
//  PopularHelper.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
enum PopularHelper {
    case all(String)
    
    private var mainPath: String {
        return "popular/"
    }
    var endPoint: URL? {
        switch self {
            case .all(let query): return CoreAPIHelper.instance.makeURL(path:"\(mainPath)all/\(query)")
        }
    }
}
