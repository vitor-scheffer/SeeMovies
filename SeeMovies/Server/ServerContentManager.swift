//
//  ServerContentManager.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import Foundation
import Alamofire

enum Endpoint: String {
    
    case getMovies = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc"
}

class ServerContentManager {
    
    public static let shared = ServerContentManager()
    
    var AF = Alamofire.Session(startRequestsImmediately: true)
    var apiKey = "3f69d581a437940d7be349a6754bc65b"
    
    public func url(path: Endpoint) -> String? {
        
        return path.rawValue + "&api_key=\(apiKey)"
    }
    
        
    public func getMovies(completion: @escaping(TopRated?, Bool) -> Void) {
        guard let url = url(path: Endpoint.getMovies) else { return }
        
        AF.request(url, method: .get, encoding: URLEncoding.default).responseData(completionHandler: { (response) in
            guard let data = response.data else { return }
            
            do {
                let response = try JSONDecoder().decode(TopRated.self, from: data)
                completion(response, true)
            } catch {
                completion(nil, false)
            }
        })
    }
}

