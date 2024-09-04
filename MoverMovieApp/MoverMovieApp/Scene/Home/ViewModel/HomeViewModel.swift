//
//  HomeViewModel.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 14.08.24.
//

import Foundation

struct HomeModel {
    let title: String?
    let movies: [MovieResult]?
}

class HomeViewModel {
    
    var items = [HomeModel]()
    let movieDetailManager: MovieDetailManager? = nil
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    let movieManager = MovieManager()
    
    func getMovies() {
        getMovieDatas(endpoint: .popularMovie)
        getMovieDatas(endpoint: .nowPlayingMovie)
        getMovieDatas(endpoint: .topRatedMovie)
        getMovieDatas(endpoint: .upcomingMovie)
    }

    func getMovieDatas(endpoint: MovieEndpoint) {
        movieManager.getMovies(endpoint: endpoint) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: endpoint.title, movies: data.results ?? []))
                self.success?()
            }
        }
    }
}
