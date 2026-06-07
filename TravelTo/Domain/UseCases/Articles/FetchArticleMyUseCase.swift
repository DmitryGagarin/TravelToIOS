//
//  fetchArticleMyUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol FetchArticleMyUseCaseProtocol {
    func execute() async throws -> [Article]
}

final class FetchArticleMyUseCase: FetchArticleMyUseCaseProtocol {
    private let repository: ArticleRepositoryProtocol

    init(repository: ArticleRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Article] {
        try await repository.fetchArticleMy()
    }
}
