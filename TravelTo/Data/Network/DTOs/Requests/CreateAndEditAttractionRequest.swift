//
//  CreateAndEditAttractionRequest.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

struct CreateAndEditAttractionRequest: Encodable {
    let ownerTelegram: String
    let attractionName: String
    let description: String
    let address: String
    let phone: String
    let website: String
    let attractionType: String
    let supportedLanguages: [String]
    
    let sundayStartTime: String
    let sundayEndTime: String
    let sundayIsRoundTheClock: Bool
    
    let mondayStartTime: String
    let mondayEndTime: String
    let mondayIsRoundTheClock: Bool
    
    let tuesdayStartTime: String
    let tuesdayEndTime: String
    let tuesdayIsRoundTheClock: Bool
    
    let wednesdayStartTime: String
    let wednesdayEndTime: String
    let wednesdayIsRoundTheClock: Bool
    
    let thursdayStartTime: String
    let thursdayEndTime: String
    let thursdayIsRoundTheClock: Bool
    
    let fridayStartTime: String
    let fridayEndTime: String
    let fridayIsRoundTheClock: Bool
    
    let saturdayStartTime: String
    let saturdayEndTime: String
    let saturdayIsRoundTheClock: Bool
    
    let worksAtSunday: Bool
    let worksAtMonday: Bool
    let worksAtTuesday: Bool
    let worksAtWednesday: Bool
    let worksAtThursday: Bool
    let worksAtFriday: Bool
    let worksAtSaturday: Bool
}
