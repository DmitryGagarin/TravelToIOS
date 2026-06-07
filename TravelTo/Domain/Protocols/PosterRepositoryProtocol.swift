//
//  PosterRepositoryProtocol.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol PosterRepositoryProtocol {
    /// GET /attraction-feature/{attractionName}/get-posters
    func fetchPosters(forAttractionName name: String) async throws -> [Poster]
    
    /// POST /attraction-feature/{attractionName}/create-poster (multipart: form + images)
    func createPoster(attractionName: String, request: CreatePosterRequest, images: [Data]) async throws -> [Poster]
}
