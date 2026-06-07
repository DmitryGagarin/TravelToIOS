//
//  UserResponseDTO.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

import Foundation

// RoleDTO – new, matches { "authority": "ROLE_..." }
struct RoleDTO: Decodable {
    let authority: String
}

struct UserResponseDTO: Decodable {
    let uuid: String?
    let email: String
    let phone: String?
    let name: String?
    let surname: String?
    let accessToken: String?          // optional – missing in GET /user/get
    let refreshToken: String?
    let isVerified: Bool?
    let authorities: [AuthorityDTO]?   // from AuthorityResponseDTO.swift
    let roles: [RoleDTO]?              // uses RoleDTO defined above
    let privacyPoliceAgreed: Bool?
    let userAgreement: Bool?
    let mailingAgreement: Bool?
    let createdAt: String?
    let answeredUsabilityQuestionnaire: Bool?
}
