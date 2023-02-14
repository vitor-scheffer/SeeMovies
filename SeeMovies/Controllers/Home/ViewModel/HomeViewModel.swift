//
//  HomeViewModel.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import Foundation
import Alamofire
import SDWebImage

protocol HomeViewModelDelegate: AnyObject {
    func setLoading()
    func removeLoading()
    func setCollecttionViewDataSource()
}

class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    
    private var movies: [Movie] = []
    
    public func getMovies() {
        
        self.delegate?.setLoading()
        
        ServerContentManager.shared.getMovies() { (response, success) in
            if success {
                guard let movies = response?.results else { return }

                DispatchQueue.main.async {
                    self.movies = movies
                    self.delegate?.setCollecttionViewDataSource()
                }
                
                self.delegate?.removeLoading()
                
            } else {
                print("Ocorreu um erro.")
            }
        }
    }
    
    public var numberOfMovieRows: Int {
        return movies.count
    }
    
    public func getCurrentMovie(index: IndexPath) -> Movie {
        return movies[index.row]
    }
}
