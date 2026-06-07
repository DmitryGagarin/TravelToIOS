//
//  DeleteAttractionUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//


import Foundation

protocol DeleteAttractionUseCaseProtocol {
    func execute(name: String) async throws -> Void
}

final class DeleteAttractionUseCase: DeleteAttractionUseCaseProtocol {
    private let repository: AttractionRepositoryProtocol

    init(repository: AttractionRepositoryProtocol) {
        self.repository = repository
    }

    func execute(name: String) async throws -> Void {
        return try await repository.deleteAttraction(name: name)
    }
}
