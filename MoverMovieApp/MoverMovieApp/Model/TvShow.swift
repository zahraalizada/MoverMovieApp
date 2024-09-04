//
//  TvShow.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 01.09.24.
//

import Foundation

// MARK: - TvShow
struct TvShow: Codable {
    let page: Int?
    let results: [TvShowResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct TvShowResult: Codable, TopImageBottomLabelProtocol {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originCountry: [String]?
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let posterPath, firstAirDate, name: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    //    Protocol Variables
        var imageName: String {
            backdropPath ?? ""
        }
        var labelText: String {
            name ?? ""
        }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
