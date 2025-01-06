//
//  PopularDTO.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.


// MARK: - PopularDTO
//
//  PopularDTO.swift
//  MoovieeAPP
//
//  Created by Javidan on 26.12.24.
//

import Foundation

// MARK: - MovieDTO
struct PopularDTO: Codable {
    let page: Int
    let results: [PopularResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct PopularResult: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
private var imageBasePath = "https://image.tmdb.org/t/p/w500"

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case fr = "fr"
}


extension PopularResult: MovieCellProtocol {
    var iconURL: String {
        imageBasePath + posterPath

    }
    
    var titleString: String {
        title
    }
    
    var subtitleString: String {
        releaseDate
    }
    
}
