//
//  CreateArticleDTO.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct CreateArticleRequest: Encodable {
    let title: String
    let content: String
    let mentionedAttractions: [String]
}
