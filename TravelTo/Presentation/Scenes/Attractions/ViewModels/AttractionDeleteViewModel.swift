//
//  AttractionDeleteViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class AttractionDeleteViewModel: ObservableObject {
    @Published var errorMessage: String?

    private let fetchUseCase: DeleteAttractionUseCaseProtocol

    init(fetchUseCase: DeleteAttractionUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(name: String) async {
        do {
            try await fetchUseCase.execute(name: name)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
