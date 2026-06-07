//
//  SignInView.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import SwiftUI

// Presentation/Auth/SignInView.swift
struct SignInView: View {
    @EnvironmentObject private var env: AppEnvironment
    @StateObject private var viewModel: SignInViewModel

    init(viewModel: SignInViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 24) {
            Text("Login Page")
                .font(.largeTitle).fontWeight(.bold)

            VStack(alignment: .leading, spacing: 8) {
                Text("Email address").font(.headline)
                TextField("Enter email", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Password").font(.headline)
                SecureField("Enter password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }

            if let error = viewModel.errorMessage {
                Text(error).foregroundColor(.red).font(.callout)
            }

            Button {
                Task { await viewModel.signIn() }
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Sign in")
                        .frame(maxWidth: .infinity).padding()
                        .background(Color.blue).foregroundColor(.white).cornerRadius(12)
                }
            }
            .disabled(viewModel.isLoading)

            // Кнопки перехода на регистрацию и восстановление пароля
            HStack(spacing: 16) {
                NavigationLink("Register") {
                    SignUpFirstStepView(viewModel: env.makeSignUpFirstStepViewModel())
                }
                .font(.callout)

                NavigationLink("Reset Password") {
//                    ResetPasswordView()  // позже реализуете
                }
                .font(.callout)
            }

            // Кнопка "Продолжить без регистрации"
            Button("Continue without registration") {
                print("🟢 Continue tapped, setting isLoggedIn = true")
                env.isLoggedIn = true
            }
            .font(.callout)
            .padding(.top)
        }
        .padding()
        .background(Color.white)
        // Оборачиваем в NavigationView только для возможности переходов на Register
        .navigationViewStyle(.stack)
    }
}
