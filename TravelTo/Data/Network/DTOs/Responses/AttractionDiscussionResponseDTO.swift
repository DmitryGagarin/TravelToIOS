//
//  AttractionDiscussionResponseDTO.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct AttractionDiscussionResponseDTO: Decodable {
    let title: String
    let contentLike: String
    let contentDislike: String
    let content: String
    let rating: Double
    let author: String
    let createdAt: String
    let images: [String]
    let imageFormats: [String]
}
