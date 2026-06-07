//
//  SignUpFirstStepViewModel.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation
import Combine

@MainActor
final class SignUpFirstStepViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var privacyPolicyAgreed: Bool = false
    @Published var userAgreementAgreed: Bool = false
    @Published var mailingAgreement: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var registeredUser: User? 
    @Published var navigateToSecondStep = false

    private let signUpFirstStepUseCase: SignUpFirstStepUseCaseProtocol

    init(signUpFirstStepUseCase: SignUpFirstStepUseCaseProtocol) {
        self.signUpFirstStepUseCase = signUpFirstStepUseCase
    }

    func registerFirstStep() async {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password are required."
            return
        }
        guard privacyPolicyAgreed && userAgreementAgreed else {
            errorMessage = "You must agree to Privacy Policy and User Agreement."
            return
        }

        isLoading = true
        errorMessage = nil
        do {
            let request = UserSignupFirstRequest(
                email: email,
                password: password,
                privacyPoliceAgreed: privacyPolicyAgreed,
                userAgreement: userAgreementAgreed,
                mailingAgreement: mailingAgreement
            )
            let user = try await signUpFirstStepUseCase.execute(request: request)
            self.registeredUser = user
            // После успешного первого шага перейти ко второму шагу
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
