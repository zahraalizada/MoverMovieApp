//
//  MovieDetailController.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 24.08.24.
//

import UIKit

class MovieDetailController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableview()
        configureViewModel()
    }
    

    func configureUI() {
        title = "MovieDetail"
    }
    
    func configureTableview() {
        tableView.register(UINib(nibName: "MovieDetailCell", bundle: nil), forCellReuseIdentifier: "MovieDetailCell")
        
    }
    
    func configureViewModel() {
        viewModel?.success = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                print(self?.viewModel?.movie)
            }
        }
        viewModel?.error = { errorMessage in
            print("Failed to fetch movie detail: \(errorMessage)")
        }
        viewModel?.getMovieDetail()
    }
}

extension MovieDetailController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailCell", for: indexPath) as! MovieDetailCell
        cell.textLabel?.text = viewModel?.movie?.title ?? ""
        return cell
    }
    
}
