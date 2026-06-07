//
//  PagedAttractionResponseDTO.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 07.05.2026.
//

struct PagedAttractionResponseDTO: Decodable {
    let _embedded: EmbeddedAttraction
    let page: PageMetadataDTO?

    var attractionList: [AttractionResponseDTO] {
        _embedded.attractionModelList
    }
}

struct EmbeddedAttraction: Decodable {
    let attractionModelList: [AttractionResponseDTO]
}

struct PageMetadataDTO: Decodable {
    let size: Int
    let totalElements: Int
    let totalPages: Int
    let number: Int
}
