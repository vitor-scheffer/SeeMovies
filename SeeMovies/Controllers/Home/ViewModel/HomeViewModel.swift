//
//  HomeViewModel.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 08/02/23.
//

import Foundation
import Alamofire

class HomeViewModel {
    
    func getMovies() {
        let parameters: Parameters = ["":""]
        
        ServerContentManager.shared.getMovies(parameters: parameters) { (response, success) in
            
            if success {
                print(response as Any)
            } else {
                print("Ocorreu um erro.")
            }
        }
    }
}
