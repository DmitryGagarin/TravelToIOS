//
//  FacilityRepositoryProtocol.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol FacilityRepositoryProtocol {
    /// GET /attraction-feature/{attractionName}/get-park-facility
    func fetchFacilities(attractionName name: String) async throws -> [Facility]
    
    /// POST /attraction-feature/{attractionName}/create-park-facility (multipart: form + images)
    func createFacility(attractionName: String, request: CreateParkFacilityRequest, images: [Data]) async throws -> [Facility]
}
