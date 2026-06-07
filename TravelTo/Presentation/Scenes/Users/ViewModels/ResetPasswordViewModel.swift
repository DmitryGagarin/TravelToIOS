//
//  ResetPasswordViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class ResetPasswordViewModel: ObservableObject {
    @Published var errorMessage: String?
    @Published var isSuccess = false

    private let resetUseCase: ResetPasswordUseCaseProtocol

    init(resetUseCase: ResetPasswordUseCaseProtocol) {
        self.resetUseCase = resetUseCase
    }

    func reset(request: PasswordResetRequest) async {
        do {
            try await resetUseCase.execute(request: request)
            isSuccess = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
