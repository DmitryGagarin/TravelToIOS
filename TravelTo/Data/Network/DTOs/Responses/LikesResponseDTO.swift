//
//  LikesResponseDTO.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct LikesResponseDTO: Decodable {
    let attraction: [AttractionResponseDTO]
}
