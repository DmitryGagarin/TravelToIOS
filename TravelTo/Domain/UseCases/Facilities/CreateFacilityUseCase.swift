//
//  CreateFacilityUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol CreateFacilityUseCaseProtocol {
    func execute(attractionName: String, request: CreateParkFacilityRequest, images: [Data]) async throws -> [Facility]
}

final class CreateFacilityUseCase: CreateFacilityUseCaseProtocol {
    private let repository: FacilityRepositoryProtocol
    
    init(repository: FacilityRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(attractionName: String, request: CreateParkFacilityRequest, images: [Data]) async throws -> [Facility] {
        return try await repository.createFacility(attractionName: attractionName, request: request, images: images)
    }
}
