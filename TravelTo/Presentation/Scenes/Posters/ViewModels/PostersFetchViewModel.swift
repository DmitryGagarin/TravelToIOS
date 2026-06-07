//
//  PostersFetchViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class PostersFetchViewModel: ObservableObject {
    @Published var posters: [Poster] = []
    @Published var errorMessage: String?

    private let fetchUseCase: FetchPostersUseCaseProtocol

    init(fetchUseCase: FetchPostersUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(attractionName: String) async {
        do {
            posters = try await fetchUseCase.execute(attractionName: attractionName)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
