//
//  PasswordResetRequest.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct PasswordResetRequest: Encodable {
    let email: String
    let token: String
    let password: String
}
