//
//  MovieDetailViewModel.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 24.08.24.
//

import Foundation

class MovieDetailViewModel {
    
    let movieDetailManager: MovieDetailManager?
    
    var movieId: Int
    var movie = [MovieResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(movieId: Int, movieDetailManager: MovieDetailManager?) {
           self.movieId = movieId
           self.movieDetailManager = movieDetailManager
           getMovieDetail()
    }
    
    func getMovieDetail() {
        movieDetailManager?.getMovieDetails(endpoint: "movie/\(movieId)", completion: { data, errorMessage  in
            if let errorMessage {
                print("Error: \(errorMessage)")
                self.error?(errorMessage)
            } else if let data {
//                print("Data: \(data)")
                self.movie.append(data)
                self.success?()
            }
        })
    }
    
}
