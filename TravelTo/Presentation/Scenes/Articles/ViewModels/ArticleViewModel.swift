//
//  ArticleViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class ArticleViewModel: ObservableObject {
    @Published var article: Article?
    @Published var errorMessage: String?

    private let fetchUseCase: FetchArticleByTitleUseCaseProtocol

    init(fetchUseCase: FetchArticleByTitleUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(title: String) async {
        do {
            article = try await fetchUseCase.execute(title: title)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
