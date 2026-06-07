//
//  UserSigninRequest.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct UserSigninRequest: Encodable {
    let email: String
    let password: String
}
