//
//  AttractionRepositoryProtocol.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol AttractionRepositoryProtocol {
    /// GET /attraction/published
    func fetchAttractions() async throws -> [Attraction]
    
    /// GET /attraction/{name}
    func fetchAttraction(byName name: String) async throws -> Attraction
    
    /// GET /attraction/search/name?name=...&page=...&size=...
    func searchAttractionByName(name: String, page: Int, size: Int) async throws -> [Attraction]
    
    /// GET /attraction/search/{type}/name?name=...&page=...&size=...
    func searchAttractionByTypeAndName(type: String, name: String, page: Int, size: Int) async throws -> [Attraction]
    
    /// GET /attraction/search/{type}/address?address=...&page=...&size=...
    func searchAttractionByTypeAndAddress(type: String, address: String, page: Int, size: Int) async throws -> [Attraction]
    
    /// GET /attraction/my
    func fetchMyAttractions() async throws -> [Attraction]
    
    /// POST /attraction/register-business (multipart: form + images)
    func createAttraction(request: CreateAndEditAttractionRequest, images: [Data]) async throws -> Attraction
    
    /// POST /attraction/edit/{currentAttractionName} (multipart: form + images)
    func editAttraction(currentName: String, request: CreateAndEditAttractionRequest, images: [Data]) async throws -> Attraction
    
    /// POST /attraction/delete/{name}
    func deleteAttraction(name: String) async throws -> Void
}
