//
//  CreateAttractionDiscussionRequest.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct CreateAttractionDiscussionRequest: Encodable {
    let title: String
    let contentLike: String
    let contentDislike: String
    let content: String
    let rating: Double
}
