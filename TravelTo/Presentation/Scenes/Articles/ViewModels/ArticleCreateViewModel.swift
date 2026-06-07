//
//  ArticleCreateViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class ArticleCreateViewModel: ObservableObject {
    @Published var article: Article?
    @Published var errorMessage: String?

    private let fetchUseCase: CreateArticleUseCaseProtocol

    init(fetchUseCase: CreateArticleUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(request: CreateArticleRequest) async {
        do {
            article = try await fetchUseCase.execute(request: request)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
