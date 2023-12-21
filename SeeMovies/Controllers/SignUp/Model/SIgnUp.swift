//
//  SignUp.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 21/12/23.
//

import Foundation

struct SignUpInput: Decodable {
    let name: String
    let email: String
    let password: String
}
