//
//  CreateDiscussionUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol CreateDiscussionUseCasepProtocol {
    func execute(attractionName: String, request: CreateAttractionDiscussionRequest, images: [Data]) async throws -> AttractionDiscussion
}

final class CreateDiscussionUseCasep: CreateDiscussionUseCasepProtocol {
    private let repository: DiscussionRepositoryProtocol
    
    init(repository: DiscussionRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(attractionName: String, request: CreateAttractionDiscussionRequest, images: [Data]) async throws -> AttractionDiscussion {
        return try await repository.createDiscussion(attractionName: attractionName, request: request, images: images)
    }
}
