//
//  FacilitiesFetchViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class FacilitiesFetchViewModel: ObservableObject {
    @Published var facilities: [Facility] = []
    @Published var errorMessage: String?
    private let fetchUseCase: FetchFacilitiesUseCaseProtocol

    init(fetchUseCase: FetchFacilitiesUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(attractionName: String) async {
        do {
            facilities = try await fetchUseCase.execute(attractionName: attractionName)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
