//
//  CurrentUserFetchViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class CurrentUserFetchViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?

    private let fetchUseCase: FetchCurrentUserUseCaseProtocol

    init(fetchUseCase: FetchCurrentUserUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load() async {
        do {
            user = try await fetchUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
