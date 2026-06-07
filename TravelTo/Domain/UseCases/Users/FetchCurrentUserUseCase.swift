//
//  FetchCurrentUserUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//


import Foundation

protocol FetchCurrentUserUseCaseProtocol {
    func execute() async throws -> User
}

final class FetchCurrentUserUseCase: FetchCurrentUserUseCaseProtocol {
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> User {
        return try await repository.fetchCurrentUser()
    }
}
