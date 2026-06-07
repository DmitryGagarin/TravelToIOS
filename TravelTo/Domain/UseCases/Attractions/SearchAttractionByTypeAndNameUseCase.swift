//
//  SearchAttractionByTypeAndNameUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol SearchAttractionByTypeAndNameUseCaseProtocol {
    func execute(type: String, name: String, page: Int, size: Int) async throws -> [Attraction]
}

final class SearchAttractionByTypeAndNameUseCase: SearchAttractionByTypeAndNameUseCaseProtocol {
    private let repository: AttractionRepositoryProtocol
    
    init(repository: AttractionRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(type: String, name: String, page: Int, size: Int) async throws -> [Attraction] {
        return try await repository.searchAttractionByTypeAndName(type: type, name: name, page: page, size: size)
    }
}
