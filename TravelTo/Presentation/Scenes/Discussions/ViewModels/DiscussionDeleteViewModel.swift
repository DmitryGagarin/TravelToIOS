//
//  DiscussionDeleteViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class DiscussionDeleteViewModel: ObservableObject {
    @Published var errorMessage: String?

    private let fetchUseCase: DeleteDiscussionUseCasepProtocol

    init(fetchUseCase: DeleteDiscussionUseCasepProtocol) {
        self.fetchUseCase = fetchUseCase
    }

    func load(uuid: String) async {
        do {
            try await fetchUseCase.execute(uuid: uuid)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
