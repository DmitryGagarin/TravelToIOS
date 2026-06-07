//
//  SaveProfileChangesUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol SaveProfileChangesUseCaseProtocol {
    func execute(request: UserProfileRequest) async throws -> User
}

final class SaveProfileChangesUseCase: SaveProfileChangesUseCaseProtocol {
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(request: UserProfileRequest) async throws -> User {
        return try await repository.saveProfileChanges(request: request)
    }
}
