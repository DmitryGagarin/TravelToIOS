//
//  FetchDiscussionsUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol FetchDiscussionUseCasepProtocol {
    func execute(attractionName: String) async throws -> [AttractionDiscussion]
}

final class FetchDiscussionUseCasep: FetchDiscussionUseCasepProtocol {
    private let repository: DiscussionRepositoryProtocol
    
    init(repository: DiscussionRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(attractionName: String) async throws -> [AttractionDiscussion] {
        return try await repository.fetchDiscussions(forAttractionName: attractionName)
    }
}
