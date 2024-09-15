//
//  SearchEndpoint.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 06.09.24.
//

import Foundation

enum SearchEndpoint {
    case searchMovie
    case searchTextMovie
    
    var path: String {
        switch self {
        case .searchMovie:
            return "discover/movie"
        case .searchTextMovie:
            return "search/movie"
        }
    }
}
