//
//  DiscussionRepositoryImpl.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

final class DiscussionRepositoryImpl: BaseRepositoryImpl, DiscussionRepositoryProtocol {
    func fetchDiscussions(forAttractionName name: String) async throws -> [AttractionDiscussion] {
//        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
//            throw APIError.invalidURL
//        }
        let url = baseURL.appendingPathComponent("attraction-discussion/\(name)")
        let dtos: [AttractionDiscussionResponseDTO] = try await apiClient.request(url)
        return dtos.compactMap(AttractionDiscussionMapper.map)
    }

    func createDiscussion(attractionName: String, request: CreateAttractionDiscussionRequest, images: [Data]) async throws -> AttractionDiscussion {
//        guard let encodedName = attractionName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
//            throw APIError.invalidURL
//        }
        let url = baseURL.appendingPathComponent("attraction-discussion/create/\(attractionName)")
        let dto: AttractionDiscussionResponseDTO = try await apiClient.multipartPost(
            url,
            jsonPart: request,
            jsonPartName: "attractionDiscussionCreateForm",
            images: images,
            imagePartName: "images"
        )
        guard let discussion = AttractionDiscussionMapper.map(dto: dto) else {
            throw RepositoryError.mappingFailed
        }
        return discussion
    }

    func deleteDiscussion(uuid: String) async throws {
        let url = baseURL.appendingPathComponent("attraction-discussion/delete/\(uuid)")
        try await apiClient.post(url: url) // POST без тела
    }
}
