//
//  SearchAttractionByTypeAndAddressUseCase.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol SearchAttractionByTypeAndAddressUseCaseProtocol {
    func execute(type: String, address: String, page: Int, size: Int) async throws -> [Attraction]
}

final class SearchAttractionByTypeAndAddressUseCase: SearchAttractionByTypeAndAddressUseCaseProtocol {
    private let repository: AttractionRepositoryProtocol

    init(repository: AttractionRepositoryProtocol) {
        self.repository = repository
    }

    func execute(type: String, address: String, page: Int, size: Int) async throws -> [Attraction] {
        return try await repository.searchAttractionByTypeAndAddress(type: type, address: address, page: page, size: size)
    }
}
