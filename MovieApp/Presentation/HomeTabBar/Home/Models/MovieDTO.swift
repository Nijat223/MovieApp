//
//  MovieDTO.swift
//  MovieApp
//
//  Created by Nijat Shikhaliyev on 02.01.25.
//

import Foundation

// MARK: - MovieDTO
struct MovieDTO: Codable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieResult
struct MovieResult: Codable {
    let backdropPath: String?
    let id: Int?
    let title, originalTitle, overview, posterPath: String?
    let mediaType: String?
    let adult: Bool?
    let originalLanguage: String?
    let genreIDS: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?
    private var imageBasePath = "https://image.tmdb.org/t/p/w500"
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}

//MARK: MovieCellProtocol
extension MovieResult: MovieCellProtocol {
    var titleString: String {
        if !(title?.isEmpty ?? true) {
            originalTitle ?? ""
        } else if !(name?.isEmpty ?? true) {
            name ?? ""
        } else {
            "Movie_title"
        }
    }
    
    var subtitleString: String {
        releaseDate ?? ""
    }
    
    var iconURL: String {
        imageBasePath + (posterPath ?? "")
    }
}
