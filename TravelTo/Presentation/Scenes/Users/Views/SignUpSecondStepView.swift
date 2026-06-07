//
//  SignUpSecondStepView.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import SwiftUI

struct SignUpSecondStepView: View {
    @EnvironmentObject var env: AppEnvironment
    @StateObject private var viewModel: SignUpSecondStepViewModel

    init(viewModel: SignUpSecondStepViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 24) {
            Text("Complete your profile")
                .font(.largeTitle).fontWeight(.bold)

            VStack(alignment: .leading, spacing: 8) {
                Text("Name").font(.headline)
                TextField("Enter your name", text: $viewModel.name)
                    .textFieldStyle(.roundedBorder).padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Surname").font(.headline)
                TextField("Enter your surname", text: $viewModel.surname)
                    .textFieldStyle(.roundedBorder).padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }

            if let error = viewModel.errorMessage {
                Text(error).foregroundColor(.red).font(.callout)
            }

            Button {
                Task { await viewModel.finishRegistration() }
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Finish registration")
                        .frame(maxWidth: .infinity).padding()
                        .background(Color.blue).foregroundColor(.white).cornerRadius(12)
                }
            }
            .disabled(viewModel.isLoading)

            // После завершения переходим на главный экран
            NavigationLink(
                destination: Text("Main screen after registration"),
                isActive: $viewModel.isRegistrationComplete,
                label: { EmptyView() }
            )
        }
        .padding()
        .background(Color.white)
    }
}
