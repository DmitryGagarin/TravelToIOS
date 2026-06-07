//
//  SaveProfileChangesViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class SaveProfileChangesViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?

    private let saveUseCase: SaveProfileChangesUseCaseProtocol

    init(saveUseCase: SaveProfileChangesUseCaseProtocol) {
        self.saveUseCase = saveUseCase
    }

    func save(request: UserProfileRequest) async {
        do {
            user = try await saveUseCase.execute(request: request)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
