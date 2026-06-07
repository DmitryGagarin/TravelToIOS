//
//  ArticleResponseDTO.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct ArticleResponseDTO: Decodable {
    let uuid: String
    let title: String
    let content: String
    let author: String
    let mentionedAttractions: [String]
    let createdAt: String
    let updatedAt: String
}
