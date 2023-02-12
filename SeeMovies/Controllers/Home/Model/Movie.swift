//
//  Movies.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 11/02/23.
//

import Foundation

struct TopRated: Decodable {
    let results: [Movie]
}

struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String
    let vote_average: Float
}
