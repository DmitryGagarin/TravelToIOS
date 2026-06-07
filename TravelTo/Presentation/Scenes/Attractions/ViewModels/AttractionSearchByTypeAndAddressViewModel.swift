//
//  AttractionSearchByTypeAndAddressViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class AttractionSearchByTypeAndAddressViewModel: ObservableObject {
    @Published var attractions: [Attraction] = []
    @Published var errorMessage: String?

    private let fetchUseCase: SearchAttractionByTypeAndAddressUseCaseProtocol

    init(fetchUseCase: SearchAttractionByTypeAndAddressUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(type: String, address: String, page: Int, size: Int) async {
        do {
            attractions = try await fetchUseCase.execute(type: type, address: address, page: page, size: size)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
