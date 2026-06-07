//
//  ResetPasswordUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol ResetPasswordUseCaseProtocol {
    func execute(request: PasswordResetRequest) async throws -> Void
}

final class ResetPasswordUseCase: ResetPasswordUseCaseProtocol {
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(request: PasswordResetRequest) async throws -> Void {
        return try await repository.resetPassword(request: request)
    }
}
