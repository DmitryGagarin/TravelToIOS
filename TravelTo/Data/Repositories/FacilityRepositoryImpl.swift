//
//  FacilityRepositoryImpl.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

final class FacilityRepositoryImpl: BaseRepositoryImpl, FacilityRepositoryProtocol {
    func fetchFacilities(attractionName name: String) async throws -> [Facility] {
//        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
//            throw APIError.invalidURL
//        }
        let url = baseURL.appendingPathComponent("attraction-feature/\(name)/get-park-facility")
        let dtos: [FacilityResponseDTO] = try await apiClient.request(url)
        return dtos.map(FacilityMapper.map)   // FacilityMapper.map возвращает не опциональный Facility
    }

    func createFacility(attractionName: String, request: CreateParkFacilityRequest, images: [Data]) async throws -> [Facility] {
//        guard let encodedName = attractionName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
//            throw APIError.invalidURL
//        }
        let url = baseURL.appendingPathComponent("attraction-feature/\(attractionName)/create-park-facility")
        let dtos: [FacilityResponseDTO] = try await apiClient.multipartPost(
            url,
            jsonPart: request,
            jsonPartName: "parkFacilityCreateForm",
            images: images,
            imagePartName: "images"
        )
        return dtos.map(FacilityMapper.map)
    }
}
