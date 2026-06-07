//
//  AttractionSearchByTypeAndNameViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class AttractionSearchByTypeAndNameViewModel: ObservableObject {
    @Published var attractions: [Attraction] = []
    @Published var errorMessage: String?

    private let fetchUseCase: SearchAttractionByTypeAndNameUseCaseProtocol

    init(fetchUseCase: SearchAttractionByTypeAndNameUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(type: String, name: String, page: Int, size: Int) async {
        do {
            attractions = try await fetchUseCase.execute(type: type, name: name, page: page, size: size)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
