//
//  PosterCreateViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class PosterCreateViewModel: ObservableObject {
    @Published var posters: [Poster] = []
    @Published var errorMessage: String?

    private let createUseCase: CreatePosterUseCaseProtocol

    init(createUseCase: CreatePosterUseCaseProtocol) {
        self.createUseCase = createUseCase
    }

    func load(attractionName: String, request: CreatePosterRequest, images: [Data]) async {
        do {
            posters = try await createUseCase.execute(
                attractionName: attractionName,
                request: request,
                images: images
            )
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
