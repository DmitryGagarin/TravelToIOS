//
//  AttractionFetchViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class AttractionFetchViewModel: ObservableObject {
    @Published var attraction: Attraction?
    @Published var errorMessage: String?

    private let fetchUseCase: FetchAttractionUseCaseProtocol

    init(fetchUseCase: FetchAttractionUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(name: String) async {
        do {
            attraction = try await fetchUseCase.execute(name: name)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
