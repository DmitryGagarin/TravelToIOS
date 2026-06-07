//
//  CreateArticleUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol CreateArticleUseCaseProtocol {
    func execute(request: CreateArticleRequest) async throws -> Article
}

final class CreateArticleUseCase: CreateArticleUseCaseProtocol {
    private let repository: ArticleRepositoryProtocol

    init(repository: ArticleRepositoryProtocol) {
        self.repository = repository
    }

    func execute(request: CreateArticleRequest) async throws -> Article {
        return try await repository.createArticle(request: request)
    }
}
