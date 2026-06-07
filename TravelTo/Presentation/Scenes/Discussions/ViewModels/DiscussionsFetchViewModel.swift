//
//  DiscussionsFetchViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class DiscussionsFetchViewModel: ObservableObject {
    @Published var discussions: [AttractionDiscussion] = []
    @Published var errorMessage: String?

    private let fetchUseCase: FetchDiscussionUseCasepProtocol

    init(fetchUseCase: FetchDiscussionUseCasepProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(attractionName: String) async {
        do {
            discussions = try await fetchUseCase.execute(attractionName: attractionName)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
