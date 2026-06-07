//
//  FetchFacilitiesUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol FetchFacilitiesUseCaseProtocol {
    func execute(attractionName: String) async throws -> [Facility]
}

final class FetchFacilitiesUseCase: FetchFacilitiesUseCaseProtocol {
    private let repository: FacilityRepositoryProtocol
    
    init(repository: FacilityRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(attractionName: String) async throws -> [Facility] {
        return try await repository.fetchFacilities(attractionName: attractionName)
    }
}
