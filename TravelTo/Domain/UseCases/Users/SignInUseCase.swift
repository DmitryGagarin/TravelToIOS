//
//  SignInUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol SignInUseCaseProtocol {
    func execute(request: UserSigninRequest) async throws -> (user: User, token: String)
}

final class SignInUseCase: SignInUseCaseProtocol {
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(request: UserSigninRequest) async throws -> (user: User, token: String) {
        return try await repository.signIn(request: request)
    }
}
