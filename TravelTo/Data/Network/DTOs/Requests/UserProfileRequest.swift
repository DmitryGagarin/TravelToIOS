//
//  UserProfileRequest.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct UserProfileRequest: Encodable {
    let name: String
    let surname: String
    let email: String
    let phone: String
}
