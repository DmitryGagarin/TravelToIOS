//
//  SignInViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var loggedInUser: User?
    // Убираем isLoggedIn, так как будем использовать окружение

    private let signInUseCase: SignInUseCaseProtocol
    private weak var env: AppEnvironment?   // слабая ссылка, чтобы избежать цикла

    init(signInUseCase: SignInUseCaseProtocol, env: AppEnvironment) {
        self.signInUseCase = signInUseCase
        self.env = env
    }

    func signIn() async {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter email and password."
            return
        }
        isLoading = true
        errorMessage = nil
        do {
            let request = UserSigninRequest(email: email, password: password)
            let result = try await signInUseCase.execute(request: request)
            self.loggedInUser = result.user
            // Устанавливаем глобальный флаг — произойдёт переход на MainTabView
            env?.isLoggedIn = true
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
