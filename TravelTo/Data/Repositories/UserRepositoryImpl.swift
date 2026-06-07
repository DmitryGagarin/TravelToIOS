//
//  UserRepositoryImpl.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

final class UserRepositoryImpl: BaseRepositoryImpl, UserRepositoryProtocol {
    private let tokenKey = "authToken"

    private func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
        apiClient.authToken = token
    }

    override init(apiClient: APIClient, baseURL: URL) {
        super.init(apiClient: apiClient, baseURL: baseURL)
        if let savedToken = UserDefaults.standard.string(forKey: tokenKey) {
            apiClient.authToken = savedToken
        }
    }

    func signUpFirstStep(request: UserSignupFirstRequest) async throws -> User {
        let url = baseURL.appendingPathComponent("signup")
        let dto: UserResponseDTO = try await apiClient.post(url, body: request)
        saveToken(dto.accessToken ?? "")
        let user = UserMapper.map(dto: dto)
        return user
    }

    func signUpSecondStep(request: UserSignupSecondRequest) async throws -> User {
        let url = baseURL.appendingPathComponent("signup/name")
        let dto: UserResponseDTO = try await apiClient.post(url, body: request)
        saveToken(dto.accessToken ?? "")
        let user = UserMapper.map(dto: dto)
        return user
    }

    func signIn(request: UserSigninRequest) async throws -> (user: User, token: String) {
        let url = baseURL.appendingPathComponent("signin")
        let dto: UserResponseDTO = try await apiClient.post(url, body: request)
        saveToken(dto.accessToken ?? "")
        let user = UserMapper.map(dto: dto)
        return (user, dto.accessToken ?? "")
    }

    func resetPassword(request: PasswordResetRequest) async throws {
        let url = baseURL.appendingPathComponent("signin/reset-password-completion")
        struct Ignore: Decodable {}
        let _: Ignore = try await apiClient.post(url, body: request)
    }

    func fetchCurrentUser() async throws -> User {
        let url = baseURL.appendingPathComponent("user/get")
        let dto: UserResponseDTO = try await apiClient.request(url)
        let user = UserMapper.map(dto: dto)
        return user
    }

    func deleteCurrentUser() async throws {
        let url = baseURL.appendingPathComponent("user/delete")
        try await apiClient.post(url: url) // POST без тела
    }

    func saveProfileChanges(request: UserProfileRequest) async throws -> User {
        let url = baseURL.appendingPathComponent("setting/save-changes")
        let dto: UserResponseDTO = try await apiClient.post(url, body: request)
        // Сервер может вернуть обновлённый токен
        saveToken(dto.accessToken ?? "")
        let user = UserMapper.map(dto: dto)
        return user
    }
}
