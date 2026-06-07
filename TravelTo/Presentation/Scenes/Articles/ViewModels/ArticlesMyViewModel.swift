//
//  ArticlesMyViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class ArticleMyViewModel: ObservableObject {
    @Published var article: [Article] = []
    @Published var errorMessage: String?

    private let fetchUseCase: FetchArticleMyUseCaseProtocol

    init(fetchUseCase: FetchArticleMyUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load() async {
        do {
            article = try await fetchUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
