//
//  Profile.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 08.06.2026.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var env: AppEnvironment

    @StateObject private var fetchVM: CurrentUserFetchViewModel
    @StateObject private var saveVM: SaveProfileChangesViewModel
    @StateObject private var deleteVM: CurrentUserDeleteViewModel

    // Local editable copies
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""   // read-only

    @State private var showDeleteConfirmation = false

    init(
        fetchVM: CurrentUserFetchViewModel,
        saveVM: SaveProfileChangesViewModel,
        deleteVM: CurrentUserDeleteViewModel
    ) {
        _fetchVM = StateObject(wrappedValue: fetchVM)
        _saveVM = StateObject(wrappedValue: saveVM)
        _deleteVM = StateObject(wrappedValue: deleteVM)
    }

    var body: some View {
        Form {
            if let user = fetchVM.user {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                        .autocapitalization(.words)
                    TextField("Surname", text: $surname)
                        .autocapitalization(.words)
                    TextField("Phone", text: $phone)
                        .keyboardType(.phonePad)
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(email)
                            .foregroundColor(.secondary)
                    }
                }

                Section {
                    Button("Save changes") {
                        Task {
                            let request = UserProfileRequest(
                                name: name,
                                surname: surname,
                                email: email,
                                phone: phone
                            )
                            await saveVM.save(request: request)
                            // If save succeeded, refresh displayed user
                            if saveVM.user != nil {
                                await fetchVM.load()
                            }
                        }
                    }
                    .disabled(name.isEmpty || surname.isEmpty)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.blue)
                }

                Section {
                    Button("Delete account") {
                        showDeleteConfirmation = true
                    }
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            } else if fetchVM.errorMessage != nil {
                Text("Error loading profile: \(fetchVM.errorMessage ?? "")")
                    .foregroundColor(.red)
            } else {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .task {
                        await fetchVM.load()
                    }
            }

            // Display global save/delete errors
            if let error = saveVM.errorMessage {
                Text(error).foregroundColor(.red)
            }
            if let error = deleteVM.errorMessage {
                Text(error).foregroundColor(.red)
            }
        }
        .navigationTitle("Profile")
        .onReceive(fetchVM.$user) { user in
            guard let user = user else { return }
            name = user.name
            surname = user.surname
            phone = user.phone ?? ""
            email = user.email
        }
        .alert("Delete account?", isPresented: $showDeleteConfirmation) {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) {
                Task {
                    await deleteVM.delete()
                    if deleteVM.errorMessage == nil {
                        env.isLoggedIn = false  // go back to login screen
                    }
                }
            }
        } message: {
            Text("This action cannot be undone. All your data will be permanently removed.")
        }
    }
}
