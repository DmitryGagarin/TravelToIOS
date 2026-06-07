//
//  DeleteCurrentUserUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol DeleteCurrentUserUseCaseProtocol {
    func execute() async throws -> Void
}

final class DeleteCurrentUserUseCase: DeleteCurrentUserUseCaseProtocol {
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> Void {
        return try await repository.deleteCurrentUser()
    }
}
