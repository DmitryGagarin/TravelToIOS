//
//  UserRepositoryProtocol.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

protocol UserRepositoryProtocol {
    /// POST /signup
    func signUpFirstStep(request: UserSignupFirstRequest) async throws -> User
    
    /// POST /signup/name
    func signUpSecondStep(request: UserSignupSecondRequest) async throws -> User
    
    /// POST /signin
    func signIn(request: UserSigninRequest) async throws -> (user: User, token: String)
    
    /// POST /signin/reset-password (начало сброса)
    func resetPassword(request: PasswordResetRequest) async throws -> Void
    
    /// GET /user/get
    func fetchCurrentUser() async throws -> User
    
    /// POST /user/delete
    func deleteCurrentUser() async throws -> Void
    
    /// POST /setting/save-changes
    func saveProfileChanges(request: UserProfileRequest) async throws -> User
}
