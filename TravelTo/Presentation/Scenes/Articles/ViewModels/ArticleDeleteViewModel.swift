//
//  ArticleDeleteViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class ArticleDeleteViewModel: ObservableObject {
    @Published var errorMessage: String?

    private let fetchUseCase: DeleteArticleUseCaseProtocol

    init(fetchUseCase: DeleteArticleUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(title: String) async {
        do {
            try await fetchUseCase.execute(title: title)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
