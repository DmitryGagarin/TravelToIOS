//
//  FacilityMapper.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

enum FacilityMapper {
    static func map(dto: FacilityResponseDTO) -> Facility {
        return Facility(
            name: dto.name,
            description: dto.description,
            image: dto.image,
            imageFormat: dto.imageFormat,
            openTime: dto.openTime,
            closeTime: dto.closeTime
        )
    }
}
