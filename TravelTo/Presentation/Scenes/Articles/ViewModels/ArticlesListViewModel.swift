//
//  ArticlesListViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class ArticlesListViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var errorMessage: String?

    private let fetchUseCase: FetchArticlesUseCaseProtocol

    init(fetchUseCase: FetchArticlesUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load() async {
        do {
            articles = try await fetchUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
