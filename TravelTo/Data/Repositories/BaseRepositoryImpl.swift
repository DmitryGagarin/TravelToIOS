//
//  BaseRepositoryImpl.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

class BaseRepositoryImpl {
    let apiClient: APIClient
    let baseURL: URL

    init(apiClient: APIClient, baseURL: URL) {
        self.apiClient = apiClient
        self.baseURL = baseURL
    }
}
