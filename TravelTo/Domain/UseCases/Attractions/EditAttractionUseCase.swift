//
//  EditAttractionUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol EditAttractionUseCaseProtocol {
    func execute(currentName: String, request: CreateAndEditAttractionRequest, images: [Data]) async throws -> Attraction
}

final class EditAttractionUseCase: EditAttractionUseCaseProtocol {
    private let repository: AttractionRepositoryProtocol

    init(repository: AttractionRepositoryProtocol) {
        self.repository = repository
    }

    func execute(currentName: String, request: CreateAndEditAttractionRequest, images: [Data]) async throws -> Attraction {
        return try await repository.editAttraction(currentName: currentName, request: request, images: images)
    }
}
