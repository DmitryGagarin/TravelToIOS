//
//  AttractionCreateViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class AttractionCreateViewModel: ObservableObject {
    @Published var attraction: Attraction?
    @Published var errorMessage: String?

    private let fetchUseCase: CreateAttractionUseCaseProtocol

    init(fetchUseCase: CreateAttractionUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(request: CreateAndEditAttractionRequest, images: [Data]) async {
        do {
            attraction = try await fetchUseCase.execute(request: request, images: images)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
