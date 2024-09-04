//
//  TvEndpoint.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 01.09.24.
//

import Foundation

enum TvEndpoint: String {
    case airingToday = "tv/airing_today"
    case onTheAir = "tv/on_the_air"
    case popularTv = "tv/popular"
    case topRated = "tv/top_rated"
    
    var name: String {
        switch self {
        case .airingToday:
            return "Airing Today"
        case .onTheAir:
            return "On The Air"
        case .popularTv:
            return "Popular"
        case .topRated:
            return "Top Rated"
        }
    }
    
}
