//
//  DiscussionRepositoryProtocol.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol DiscussionRepositoryProtocol {
    /// GET /attraction-discussion/{attractionName}
    func fetchDiscussions(forAttractionName name: String) async throws -> [AttractionDiscussion]
    
    /// POST /attraction-discussion/create/{attractionName} (multipart: form + images)
    func createDiscussion(attractionName: String, request: CreateAttractionDiscussionRequest, images: [Data]) async throws -> AttractionDiscussion
    
    /// POST /attraction-discussion/delete/{attractionUuid}
    func deleteDiscussion(uuid: String) async throws -> Void
}
