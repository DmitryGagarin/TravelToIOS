//
//  ArticleMapper.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

enum ArticleMapper {
    private static let isoFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    
    static func map(dto: ArticleResponseDTO) -> Article? {
        guard let createdAt = isoFormatter.date(from: dto.createdAt),
              let updatedAt = isoFormatter.date(from: dto.updatedAt) else {
            return nil
        }
        return Article(
            uuid: dto.uuid,
            title: dto.title,
            content: dto.content,
            author: dto.author,
            mentionedAttractions: dto.mentionedAttractions,
            createdAt: createdAt,
            updatedAt: updatedAt
        )
    }
}
