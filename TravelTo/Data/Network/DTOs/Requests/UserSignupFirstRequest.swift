//
//  UserSignupFirstRequest.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct UserSignupFirstRequest: Encodable {
    let email: String
    let password: String
    let privacyPoliceAgreed: Bool
    let userAgreement: Bool
    let mailingAgreement: Bool
}
