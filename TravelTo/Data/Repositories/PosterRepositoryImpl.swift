//
//  PosterRepositoryImpl.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

final class PosterRepositoryImpl: BaseRepositoryImpl, PosterRepositoryProtocol {
    func fetchPosters(forAttractionName name: String) async throws -> [Poster] {
//        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
//            throw APIError.invalidURL
//        }
        let url = baseURL.appendingPathComponent("attraction-feature/\(name)/get-posters")
        let dtos: [PosterResponseDTO] = try await apiClient.request(url)
        return dtos.compactMap(PosterMapper.map)
    }

    func createPoster(attractionName: String, request: CreatePosterRequest, images: [Data]) async throws -> [Poster] {
//        guard let encodedName = attractionName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
//            throw APIError.invalidURL
//        }
        let url = baseURL.appendingPathComponent("attraction-feature/\(attractionName)/create-poster")
        let dtos: [PosterResponseDTO] = try await apiClient.multipartPost(
            url,
            jsonPart: request,
            jsonPartName: "posterCreateForm",
            images: images,
            imagePartName: "images"
        )
        return dtos.compactMap(PosterMapper.map)
    }
}
