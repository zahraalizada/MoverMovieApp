//
//  MovieListUseCase.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 19.08.24.
//

import Foundation

protocol MovieListUseCase {
    func getMovieList(endpoint: MovieEndpoint, completion: @escaping((Movie?, String?) -> Void))
}
