//
//  CreateTextMenuRequest.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct CreateTextMenuRequest: Encodable {
    let names: [String]
    let descriptions: [String]
    let price: [String]
}
