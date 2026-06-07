//
//  FetchArticlesUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol FetchArticlesUseCaseProtocol {
    func execute() async throws -> [Article]
}

final class FetchArticlesUseCase: FetchArticlesUseCaseProtocol {
    private let repository: ArticleRepositoryProtocol

    init(repository: ArticleRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Article] {
        return try await repository.fetchArticles()
    }
}
