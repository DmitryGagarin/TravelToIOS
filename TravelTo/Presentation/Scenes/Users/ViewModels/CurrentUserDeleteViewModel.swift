//
//  CurrentUserDeleteViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class CurrentUserDeleteViewModel: ObservableObject {
    @Published var errorMessage: String?

    private let deleteUseCase: DeleteCurrentUserUseCaseProtocol

    init(deleteUseCase: DeleteCurrentUserUseCaseProtocol) {
        self.deleteUseCase = deleteUseCase
    }

    func delete() async {
        do {
            try await deleteUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
