//
//  MovieEndpoint.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 19.08.24.
//

import Foundation

enum MovieEndpoint: String {
    case popularMovie = "movie/popular"
    case nowPlayingMovie = "movie/now_playing"
    case topRatedMovie = "movie/top_rated"
    case upcomingMovie = "movie/upcoming"
    
    var title: String {
        switch self {
        case .popularMovie:
            return "Popular"
        case .nowPlayingMovie:
            return "Now Playing"
        case .topRatedMovie:
            return "Top Rated"
        case .upcomingMovie:
            return "Upcoming"
        }
    }
}


