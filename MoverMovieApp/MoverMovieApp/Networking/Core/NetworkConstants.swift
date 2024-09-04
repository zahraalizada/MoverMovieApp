//
//  NetworkConstant.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 16.08.24.
//


import Foundation
import Alamofire

class NetworkConstants {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMTZlZjAzNWI4ZjIxY2UwYThmNjY5MTViYWI4ZTVmMyIsIm5iZiI6MTcyMDYyNzEyMS43NDIxNTUsInN1YiI6IjY2OGVhMTcyZWVhZjdlYWZkMjY5OWM2NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HmDbfU0tkW01u7IyvpF4TUI1h8p39zGw5U1sb496Q3U"]
    
    static let baseImageUrl = "https://image.tmdb.org/t/p/original"
    
    static func getUrl(with endpoint: String) -> String {
        baseURL + endpoint
    }
    
    static func getImageUrl(with path: String) -> String {
        baseImageUrl + path
    }
}



