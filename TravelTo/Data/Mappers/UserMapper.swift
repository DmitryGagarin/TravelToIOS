//
//  UserMapper.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

enum UserMapper {
    // Custom date formatter for "2026-06-07 23:56:52"
    private static let customDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()

    static func map(dto: UserResponseDTO) -> User {
        // Parse createdAt (fallback to Date() if missing or invalid)
        let createdAtDate: Date = {
            guard let dateString = dto.createdAt,
                  let date = customDateFormatter.date(from: dateString) else {
                return Date()
            }
            return date
        }()

        // Extract all role strings from either authorities or roles
        var allRoleStrings: [String] = []
        if let authorities = dto.authorities {
            allRoleStrings = authorities.map { $0.authority }
        } else if let roles = dto.roles {
            allRoleStrings = roles.map { $0.authority }   // ← fixed: extract authority from RoleDTO
        }
        let userRoles = allRoleStrings.compactMap { Role(rawValue: $0) }

        return User(
            name: dto.name ?? "",
            surname: dto.surname ?? "",
            email: dto.email,
            phone: dto.phone ?? "",
            createdAt: createdAtDate,
            roles: userRoles,
            accessToken: dto.accessToken ?? "",   // ← safe default
            answeredUsabilityQuestionnaire: dto.answeredUsabilityQuestionnaire ?? false
        )
    }
}
