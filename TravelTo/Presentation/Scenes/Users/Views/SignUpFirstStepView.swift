//
//  SignUpFirstStepView.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import SwiftUI

struct SignUpFirstStepView: View {
    @EnvironmentObject var env: AppEnvironment
    @StateObject private var viewModel: SignUpFirstStepViewModel

    init(viewModel: SignUpFirstStepViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 24) {
            Text("Register").font(.largeTitle).fontWeight(.bold)

            VStack(alignment: .leading, spacing: 8) {
                Text("Email address").font(.headline)
                TextField("Enter email", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder).padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Password").font(.headline)
                SecureField("Enter password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder).padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }

            VStack(alignment: .leading, spacing: 12) {
                Toggle("I agree to Privacy Policy", isOn: $viewModel.privacyPolicyAgreed)
                Toggle("I agree to User Agreement", isOn: $viewModel.userAgreementAgreed)
                Toggle("I want to receive emails", isOn: $viewModel.mailingAgreement)
            }

            if let error = viewModel.errorMessage {
                Text(error).foregroundColor(.red).font(.callout)
            }

            Button {
                Task { await viewModel.registerFirstStep() }
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Continue")
                        .frame(maxWidth: .infinity).padding()
                        .background(Color.blue).foregroundColor(.white).cornerRadius(12)
                }
            }
            .disabled(viewModel.isLoading)

            // Навигация на второй шаг
            NavigationLink(
                destination: SignUpSecondStepView(viewModel: env.makeSignUpSecondStepViewModel()),
                isActive: $viewModel.navigateToSecondStep,
                label: { EmptyView() }
            )
        }
        .padding()
        .background(Color.white)
    }
}
