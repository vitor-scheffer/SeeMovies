//
//  HomeViewModel.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import Foundation
import Alamofire
import SDWebImage

class HomeViewModel {
    
    private var movies: [Movie] = []
    
    public func getMovies() {
        
        ServerContentManager.shared.getMovies() { (response, success) in
            if success {
                guard let movies = response?.results else { return }

                DispatchQueue.main.async {
                    self.movies = movies
                }
            } else {
                print("Ocorreu um erro.")
            }
        }
    }
}
