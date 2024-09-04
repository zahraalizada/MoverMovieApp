//
//  TvShowsViewModel.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 14.08.24.
//

import Foundation

struct TvModel {
    let name: String?
    let shows: [TvShowResult]?
}

class TvShowsViewModel {
    
    var items = [TvModel]()
    let tvShowDetailManager: TvShowDetailManager? = nil
    var success: (() -> Void)?
    var error: ((String)-> Void)?
    
    let tvManager = TvManager()
    
    func getTvShows() {
        getTvShowsDatas(endpoint: .airingToday)
        getTvShowsDatas(endpoint: .onTheAir)
        getTvShowsDatas(endpoint: .popularTv)
        getTvShowsDatas(endpoint: .topRated)
    }
    
    func getTvShowsDatas(endpoint: TvEndpoint) {
        tvManager.getTvShows(endpoint: endpoint) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(name: endpoint.name, shows: data.results ?? []))
                self.success?()
            }
        }
    }
}
