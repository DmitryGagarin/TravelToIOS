//
//  SignUpSecondStepViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class SignUpSecondStepViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isRegistrationComplete: Bool = false
    @Published var completedUser: User?

    private let signUpSecondStepUseCase: SignUpSecondStepUseCaseProtocol

    init(signUpSecondStepUseCase: SignUpSecondStepUseCaseProtocol) {
        self.signUpSecondStepUseCase = signUpSecondStepUseCase
    }

    func finishRegistration() async {
        guard !name.isEmpty, !surname.isEmpty else {
            errorMessage = "Name and surname are required."
            return
        }
        isLoading = true
        errorMessage = nil
        do {
            let request = UserSignupSecondRequest(name: name, surname: surname)
            let user = try await signUpSecondStepUseCase.execute(request: request)
            self.completedUser = user
            isRegistrationComplete = true
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
