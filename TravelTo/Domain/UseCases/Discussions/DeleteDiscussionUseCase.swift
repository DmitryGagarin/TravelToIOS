//
//  DeleteDiscussionUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol DeleteDiscussionUseCasepProtocol {
    func execute(uuid: String) async throws -> Void
}

final class DeleteDiscussionUseCasep: DeleteDiscussionUseCasepProtocol {
    private let repository: DiscussionRepositoryProtocol
    
    init(repository: DiscussionRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(uuid: String) async throws -> Void {
        return try await repository.deleteDiscussion(uuid: uuid)
    }
}
