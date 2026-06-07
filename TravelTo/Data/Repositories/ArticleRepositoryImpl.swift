//
//  ArticleRepositoryImpl.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

final class ArticleRepositoryImpl: BaseRepositoryImpl, ArticleRepositoryProtocol {
    func fetchArticles() async throws -> [Article] {
        let url = baseURL.appendingPathComponent("article/")
        let dtos: [ArticleResponseDTO] = try await apiClient.request(url)
        return dtos.compactMap(ArticleMapper.map)
    }

    func fetchArticleByTitle(byTitle title: String) async throws -> Article {
        guard let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            throw APIError.invalidURL
        }
        let url = baseURL.appendingPathComponent("article/\(encodedTitle)")
        let dto: ArticleResponseDTO = try await apiClient.request(url)
        guard let article = ArticleMapper.map(dto: dto) else {
            throw RepositoryError.mappingFailed
        }
        return article
    }

    func fetchArticleMy() async throws -> [Article] {
        let url = baseURL.appendingPathComponent("article/my")
        let dtos: [ArticleResponseDTO] = try await apiClient.request(url)
        return dtos.compactMap(ArticleMapper.map)
    }

    func createArticle(request: CreateArticleRequest) async throws -> Article {
        let url = baseURL.appendingPathComponent("article/create")
        let dto: ArticleResponseDTO = try await apiClient.post(url, body: request)
        guard let article = ArticleMapper.map(dto: dto) else {
            throw RepositoryError.mappingFailed
        }
        return article
    }

    func deleteArticle(title: String) async throws {
        guard let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            throw APIError.invalidURL
        }
        let url = baseURL.appendingPathComponent("article/delete/\(encodedTitle)")
        try await apiClient.post(url: url) // POST без тела
    }
}
