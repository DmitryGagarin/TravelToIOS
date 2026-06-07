//
//  User.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

import Foundation

struct User {
    let name: String
    let surname: String
    let email: String
    let phone: String
    let createdAt: Date
    let roles: [Role]          
    let accessToken: String
    let answeredUsabilityQuestionnaire: Bool
}

enum Role: String {
    case user = "ROLE_USER"
    case admin = "ROLE_ADMIN"
    case owner = "ROLE_OWNER"
    case discussionOwner = "ROLE_DISCUSSION_OWNER"
    case writer = "ROLE_WRITER"
    
}
