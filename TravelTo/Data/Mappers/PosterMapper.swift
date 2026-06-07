//
//  PosterMapper.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

enum PosterMapper {
    private static let isoFormatter = ISO8601DateFormatter()
    
    static func map(dto: PosterResponseDTO) -> Poster? {
        guard let start = isoFormatter.date(from: dto.startDate),
              let end = isoFormatter.date(from: dto.endDate) else {
            return nil
        }
        return Poster(
            image: dto.image,
            imageFormat: dto.imageFormat,
            startDate: start,
            endDate: end,
            price: dto.price,
            posterName: dto.posterName
        )
    }
}
