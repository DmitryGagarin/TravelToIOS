//
//  AttractionsMyFetchViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class AttractionsMyFetchViewModel: ObservableObject {
    @Published var attractions: [Attraction] = []
    @Published var errorMessage: String?

    private let fetchUseCase: FetchMyAttractionUseCaseProtocol

    init(fetchUseCase: FetchMyAttractionUseCaseProtocol) {
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
