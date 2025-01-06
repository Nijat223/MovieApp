//
//  NowPlayingDTO.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 05.01.25.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nowPlayingDTO = try? JSONDecoder().decode(NowPlayingDTO.self, from: jsonData)

import Foundation

// MARK: - NowPlayingDTO
struct NowPlayingDTO: Codable {
    let dates: NowPlayingDates
    let page: Int
    let results: [NowPlayingResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct NowPlayingDates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct NowPlayingResult: Codable {
    let adult: Bool
    let backdropPath: String?
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



extension NowPlayingResult: MovieCellProtocol {
    var titleString: String {
        title
    }
    
    var subtitleString: String {
        releaseDate
    }
    
    var iconURL: String {
         imageBasePath + posterPath
    }
    
    
}
