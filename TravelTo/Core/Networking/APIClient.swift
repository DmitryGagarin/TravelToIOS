//
//  APIClient.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int, data: Data?)
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .invalidResponse: return "Invalid response from server"
        case .httpError(let code, _): return "HTTP error \(code)"
        case .decodingError(let err): return "Decoding error: \(err.localizedDescription)"
        }
    }
}

final class APIClient {
    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    var authToken: String?
    
    init(session: URLSession = .shared,
         decoder: JSONDecoder = JSONDecoder(),
         encoder: JSONEncoder = JSONEncoder()) {
        self.session = session
        self.decoder = decoder
        self.encoder = encoder
    }
    
    /// Универсальный GET-запрос
    func request<T: Decodable>(_ url: URL) async throws -> T {
        var urlRequest = URLRequest(url: url)
        applyAuthHeader(to: &urlRequest)
        let (data, response) = try await session.data(for: urlRequest)
        try validate(response: response, data: data)
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }
    
    /// Универсальный POST-запрос с JSON телом
    func post<T: Encodable, R: Decodable>(_ url: URL, body: T) async throws -> R {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        applyAuthHeader(to: &request)
        let bodyData = try encoder.encode(body)
        request.httpBody = bodyData
        
        let (data, response) = try await session.data(for: request)
        if let jsonString = String(data: data, encoding: .utf8) {
            print("SIGNIN RESPONSE: \(jsonString)")
        }
        try validate(response: response, data: data)
        do {
            return try decoder.decode(R.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }
    
    /// Пустой POST-запрос (для delete-like операций)
    func post(url: URL) async throws {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        applyAuthHeader(to: &request)
        let (data, response) = try await session.data(for: request)
        try validate(response: response, data: data)
    }
    
    /// Универсальный multipart/form-data запрос
    func multipartPost<T: Encodable, R: Decodable>(
        _ url: URL,
        jsonPart: T,
        jsonPartName: String,
        images: [Data],
        imagePartName: String,
        fileName: String = "image.jpg",
        mimeType: String = "image/jpeg"
    ) async throws -> R {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        if let token = authToken {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        var body = Data()
        
        // 1. JSON часть
        let jsonData = try encoder.encode(jsonPart)
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(jsonPartName)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: application/json\r\n\r\n".data(using: .utf8)!)
        body.append(jsonData)
        body.append("\r\n".data(using: .utf8)!)
        
        // 2. Файлы
        for (index, imageData) in images.enumerated() {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            let fileFieldName = "\(imagePartName)"
            let fileIdentifier = "\(fileName)_\(index)"
            body.append("Content-Disposition: form-data; name=\"\(fileFieldName)\"; filename=\"\(fileIdentifier)\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
            body.append(imageData)
            body.append("\r\n".data(using: .utf8)!)
        }
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpBody = body
        
        let (data, response) = try await session.data(for: request)
        try validate(response: response, data: data)
        do {
            return try decoder.decode(R.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }
    
    private func applyAuthHeader(to request: inout URLRequest) {
        if let token = authToken {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            print("🟢 TOKEN SENT for \(request.url?.absoluteString ?? ""): \(token.prefix(20))...")
        } else {
            print("🔴 NO TOKEN for \(request.url?.absoluteString ?? "")")
        }
    }
    
    private func validate(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard 200..<300 ~= httpResponse.statusCode else {
            throw APIError.httpError(statusCode: httpResponse.statusCode, data: data)
        }
    }
}
