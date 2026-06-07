//
//  PosterResponseDTO.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct PosterResponseDTO: Decodable {
    let image: String
    let imageFormat: String
    let startDate: String
    let endDate: String
    let price: Double
    let posterName: String
}
