//
//  SignIn.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 21/12/23.
//

import Foundation

struct SignInInput: Decodable {
    let email: String
    let password: String
}
