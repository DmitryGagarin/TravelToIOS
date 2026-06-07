//
//  DeleteArticleUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol DeleteArticleUseCaseProtocol {
    func execute(title: String) async throws -> Void
}

final class DeleteArticleUseCase: DeleteArticleUseCaseProtocol {
    private let repository: ArticleRepositoryProtocol

    init(repository: ArticleRepositoryProtocol) {
        self.repository = repository
    }

    func execute(title: String) async throws {
        try await repository.deleteArticle(title: title)
    }
}
