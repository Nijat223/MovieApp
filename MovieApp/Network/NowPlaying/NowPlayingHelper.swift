//
//  NowPlayingHelper.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//

import Foundation
enum NowPlayingHelper {
    case NowPlaying
    
    private var mainPath: String {
        return "movie/now_playing"
    }
    var endPoint: URL? {
        switch self {
            case .NowPlaying: return CoreAPIHelper.instance.makeURL(path: mainPath)
        }
    }
}
