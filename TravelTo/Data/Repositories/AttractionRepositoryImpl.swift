//
//  AttractionRepositoryImpl.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

final class AttractionRepositoryImpl: BaseRepositoryImpl, AttractionRepositoryProtocol {
    private func urlWithQuery(path: String, params: [String: String]) -> URL? {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else { return nil }
        components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components.url
    }

    func fetchAttractions() async throws -> [Attraction] {
        let url = baseURL.appendingPathComponent("attraction/published")
        let paged: PagedAttractionResponseDTO = try await apiClient.request(url)
        let dtos = paged.attractionList
        return dtos.map(AttractionMapper.map)
    }

    func fetchAttraction(byName name: String) async throws -> Attraction {
//        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
//            throw APIError.invalidURL
//        }
        let url = baseURL.appendingPathComponent("attraction/\(name)")
        let dto: AttractionResponseDTO = try await apiClient.request(url)
        return AttractionMapper.map(dto: dto)
    }

    func searchAttractionByName(name: String, page: Int, size: Int) async throws -> [Attraction] {
        guard let url = urlWithQuery(path: "attraction/search/name",
                                     params: ["name": name, "page": "\(page)", "size": "\(size)"]) else {
            throw APIError.invalidURL
        }
        let dtos: [AttractionResponseDTO] = try await apiClient.request(url)
        return dtos.map(AttractionMapper.map)
    }

    func searchAttractionByTypeAndName(type: String, name: String, page: Int, size: Int) async throws -> [Attraction] {
        guard let url = urlWithQuery(path: "attraction/search/\(type)/name",
                                     params: ["name": name, "page": "\(page)", "size": "\(size)"]) else {
            throw APIError.invalidURL
        }
        let dtos: [AttractionResponseDTO] = try await apiClient.request(url)
        return dtos.map(AttractionMapper.map)
    }

    func searchAttractionByTypeAndAddress(type: String, address: String, page: Int, size: Int) async throws -> [Attraction] {
        guard let url = urlWithQuery(path: "attraction/search/\(type)/address",
                                     params: ["address": address, "page": "\(page)", "size": "\(size)"]) else {
            throw APIError.invalidURL
        }
        let dtos: [AttractionResponseDTO] = try await apiClient.request(url)
        return dtos.map(AttractionMapper.map)
    }

    func fetchMyAttractions() async throws -> [Attraction] {
        let url = baseURL.appendingPathComponent("attraction/my")
        let dtos: [AttractionResponseDTO] = try await apiClient.request(url)
        return dtos.map(AttractionMapper.map)
    }

    func createAttraction(request: CreateAndEditAttractionRequest, images: [Data]) async throws -> Attraction {
        let url = baseURL.appendingPathComponent("attraction/register-business")
        let dto: AttractionResponseDTO = try await apiClient.multipartPost(
            url,
            jsonPart: request,
            jsonPartName: "attractionCreateAndEditForm",
            images: images,
            imagePartName: "images"
        )
        return AttractionMapper.map(dto: dto)
    }

    func editAttraction(currentName: String, request: CreateAndEditAttractionRequest, images: [Data]) async throws -> Attraction {
//        guard let encodedName = currentName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
//            throw APIError.invalidURL
//        }
        let url = baseURL.appendingPathComponent("attraction/edit/\(currentName)")
        let dto: AttractionResponseDTO = try await apiClient.multipartPost(
            url,
            jsonPart: request,
            jsonPartName: "attractionCreateAndEditForm",
            images: images,
            imagePartName: "images"
        )
        return AttractionMapper.map(dto: dto)
    }

    func deleteAttraction(name: String) async throws {
//        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
//            throw APIError.invalidURL
//        }
        let url = baseURL.appendingPathComponent("attraction/delete/\(name)")
        try await apiClient.post(url: url) // POST без тела
    }
}
