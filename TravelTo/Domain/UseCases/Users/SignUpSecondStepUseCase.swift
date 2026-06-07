//
//  SignUpSecondStepUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol SignUpSecondStepUseCaseProtocol {
    func execute(request: UserSignupSecondRequest) async throws -> User
}

final class SignUpSecondStepUseCase: SignUpSecondStepUseCaseProtocol {
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(request: UserSignupSecondRequest) async throws -> User {
        return try await repository.signUpSecondStep(request: request)
    }
}
