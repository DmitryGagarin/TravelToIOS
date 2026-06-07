//
//  DiscussionCreateViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class DiscussionCreateViewModel: ObservableObject {
    @Published var discussion: AttractionDiscussion?
    @Published var errorMessage: String?

    private let fetchUseCase: CreateDiscussionUseCasepProtocol

    init(fetchUseCase: CreateDiscussionUseCasepProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(request: CreateAttractionDiscussionRequest, images: [Data], attractionName: String) async {
        do {
            discussion = try await fetchUseCase.execute(attractionName: attractionName, request: request, images: images)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
