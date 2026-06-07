//
//  CreateParkFacilityRequest.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct CreateParkFacilityRequest: Encodable {
    let names: [String]
    let descriptions: [String]
    let openTimes: [String]
    let closeTime: [String]
}
