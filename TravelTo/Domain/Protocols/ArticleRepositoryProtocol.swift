//
//  ArticleRepositoryProtocol.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol ArticleRepositoryProtocol {
    /// GET /article/
    func fetchArticles() async throws -> [Article]
    /// GET /article/{title}
    func fetchArticleByTitle(byTitle title: String) async throws -> Article
    /// GET /article/my
    func fetchArticleMy() async throws -> [Article]
    /// POST /article/create
    func createArticle(request: CreateArticleRequest) async throws -> Article
    /// POST /article/delete/{articleTitle}
    func deleteArticle(title: String) async throws -> Void
}
