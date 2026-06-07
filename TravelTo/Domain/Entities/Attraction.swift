//
//  Attraction.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

import Foundation

struct Attraction {
    let uuid: String
    let name: String
    let description: String
    let address: String
    let images: [String]
    let imageFormats: [String]
    let phone: String
    let website: String
    let type: String
    let rating: Double
    let status: String
    let mentionedInArticlesTitles: [String]
    let supportedLanguages: [String]
    let schedule: [DayOfWeek: DaySchedule]
}

enum DayOfWeek: String, CaseIterable {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

struct DaySchedule {
    let startTime: String?       
    let endTime: String?
    let isRoundTheClock: Bool
    let works: Bool
}
