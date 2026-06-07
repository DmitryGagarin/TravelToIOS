//
//  FacilityResponseDTO.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct FacilityResponseDTO: Decodable {
    let name: String
    let description: String
    let image: String
    let imageFormat: String
    let openTime: String
    let closeTime: String
}
