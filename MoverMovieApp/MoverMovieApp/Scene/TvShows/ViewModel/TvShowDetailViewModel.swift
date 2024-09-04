//
//  TvShowDetailViewModel.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 03.09.24.
//

import Foundation

class TvShowDetailViewModel {
    var tvShowDetailManager: TvShowDetailManager? = nil
    
    var seriesId: Int = 0
    var tvShow = [TvShowResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(seriesId: Int, tvShowDetailManager: TvShowDetailManager?, success: ( () -> Void)? = nil, error: ( (String) -> Void)? = nil) {
        self.tvShowDetailManager = tvShowDetailManager
        self.seriesId = seriesId
        self.success = success
        self.error = error
    }
    
    func getTvShowDetail() {
        tvShowDetailManager?.getTvShowDetails(seriesId: seriesId, completion: { data, errorMessage in
            if let errorMessage {
                print("Error: \(errorMessage)")
                self.error?(errorMessage)
            } else if let data {
//                print("Data: \(data)")
                self.tvShow.append(data)
                self.success?()
            }
        })
    }
    
}
