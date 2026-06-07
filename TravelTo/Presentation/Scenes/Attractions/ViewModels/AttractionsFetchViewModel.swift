//
//  AttractionsFetchViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class AttractionsFetchViewModel: ObservableObject {
    @Published var attractions: [Attraction] = []
    @Published var errorMessage: String?

    private let fetchUseCase: FetchAttractionsUseCaseProtocol

    init(fetchUseCase: FetchAttractionsUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load() async {
        do {
            attractions = try await fetchUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
