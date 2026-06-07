//
//  SignUpFirstStepUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol SignUpFirstStepUseCaseProtocol {
    func execute(request: UserSignupFirstRequest) async throws -> User
}

final class SignUpFirstStepUseCase: SignUpFirstStepUseCaseProtocol {
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(request: UserSignupFirstRequest) async throws -> User {
        return try await repository.signUpFirstStep(request: request)
    }
}
