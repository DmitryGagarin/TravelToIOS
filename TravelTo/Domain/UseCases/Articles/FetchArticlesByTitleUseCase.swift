//
//  FetchArticlesByTitleUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol FetchArticleByTitleUseCaseProtocol {
    func execute(title: String) async throws -> Article
}

final class FetchArticleByTitleUseCase: FetchArticleByTitleUseCaseProtocol {
    private let repository: ArticleRepositoryProtocol

    init(repository: ArticleRepositoryProtocol) {
        self.repository = repository
    }

    func execute(title: String) async throws -> Article {
        try await repository.fetchArticleByTitle(byTitle: title)
    }
}
