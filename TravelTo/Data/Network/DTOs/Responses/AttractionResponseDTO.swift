//
//  AttractionResponseDTO.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct AttractionResponseDTO: Decodable {
    let uuid: String
    let name: String
    let description: String?
    let address: String?
    let images: [String]?
    let imagesFormats: [String]?
    let phone: String?
    let website: String?
    let type: String?
    let rating: Double?
    let status: String?
    let mentionedInArticlesTitles: [String]?
    let supportedLanguages: [String]?
    let sundayStartTime: String?
    let sundayEndTime: String?
    let sundayIsRoundTheClock: Bool?
    let worksAtSunday: Bool?
    let mondayStartTime: String?
    let mondayEndTime: String?
    let mondayIsRoundTheClock: Bool?
    let worksAtMonday: Bool?
    let tuesdayStartTime: String?
    let tuesdayEndTime: String?
    let tuesdayIsRoundTheClock: Bool?
    let worksAtTuesday: Bool?
    let wednesdayStartTime: String?
    let wednesdayEndTime: String?
    let wednesdayIsRoundTheClock: Bool?
    let worksAtWednesday: Bool?
    let thursdayStartTime: String?
    let thursdayEndTime: String?
    let thursdayIsRoundTheClock: Bool?
    let worksAtThursday: Bool?
    let fridayStartTime: String?
    let fridayEndTime: String?
    let fridayIsRoundTheClock: Bool?
    let worksAtFriday: Bool?
    let saturdayStartTime: String?
    let saturdayEndTime: String?
    let saturdayIsRoundTheClock: Bool?
    let worksAtSaturday: Bool?
}
