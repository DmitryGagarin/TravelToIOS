//
//  AttractionEditViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class AttractionEditViewModel: ObservableObject {
    @Published var attraction: Attraction?
    @Published var errorMessage: String?

    private let fetchUseCase: EditAttractionUseCaseProtocol

    init(fetchUseCase: EditAttractionUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(request: CreateAndEditAttractionRequest, images: [Data], currentName: String) async {
        do {
            try await fetchUseCase.execute(currentName: currentName, request: request, images: images)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
