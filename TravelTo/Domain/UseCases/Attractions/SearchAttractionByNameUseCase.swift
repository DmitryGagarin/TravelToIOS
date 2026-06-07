//
//  SearchAttractionByNameUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol SearchAttractionByNameUseCaseProtocol {
    func execute(name: String, page: Int, size: Int) async throws -> [Attraction]
}

final class SearchAttractionByNameUseCase: SearchAttractionByNameUseCaseProtocol {
    private let repository: AttractionRepositoryProtocol

    init(repository: AttractionRepositoryProtocol) {
        self.repository = repository
    }

    func execute(name: String, page: Int, size: Int) async throws -> [Attraction] {
        return try await repository.searchAttractionByName(name: name, page: page, size: size)
    }
}
