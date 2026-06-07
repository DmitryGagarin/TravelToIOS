//
//  AttractionDiscussionMapper.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

enum AttractionDiscussionMapper {
    private static let isoFormatter = ISO8601DateFormatter()
    
    static func map(dto: AttractionDiscussionResponseDTO) -> AttractionDiscussion? {
        guard let createdAt = isoFormatter.date(from: dto.createdAt) else {
            return nil
        }
        return AttractionDiscussion(
            title: dto.title,
            contentLike: dto.contentLike,
            contentDislike: dto.contentDislike,
            content: dto.content,
            rating: dto.rating,
            author: dto.author,
            createdAt: createdAt,
            images: dto.images,
            imageFormats: dto.imageFormats
        )
    }
}
