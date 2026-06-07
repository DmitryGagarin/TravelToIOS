//
//  AttractionSearchByNameViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class AttractionSearchByNameViewModel: ObservableObject {
    @Published var attractions: [Attraction] = []
    @Published var errorMessage: String?

    private let fetchUseCase: SearchAttractionByNameUseCaseProtocol

    init(fetchUseCase: SearchAttractionByNameUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(name: String, page: Int, size: Int) async {
        do {
            attractions = try await fetchUseCase.execute(name: name, page: page, size: size)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
