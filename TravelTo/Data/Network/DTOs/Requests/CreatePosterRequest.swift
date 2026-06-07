//
//  CreatePosterRequest.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct CreatePosterRequest: Encodable {
    let openTime: [String]
    let closeTime: [String]
    let startDate: [String]
    let endDate: [String]
    let price: [Double]
    let posterNam: [String]
}
