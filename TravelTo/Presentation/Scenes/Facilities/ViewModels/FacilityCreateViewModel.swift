//
//  FacilityCreateViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class FacilityCreateViewModel: ObservableObject {
    @Published var facilities: [Facility] = []
    @Published var errorMessage: String?
    private let createUseCase: CreateFacilityUseCaseProtocol

    init(createUseCase: CreateFacilityUseCaseProtocol) {
        self.createUseCase = createUseCase
    }

    func load(attractionName: String, request: CreateParkFacilityRequest, images: [Data]) async {
        do {
            facilities = try await createUseCase.execute(attractionName: attractionName, request: request, images: images)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
