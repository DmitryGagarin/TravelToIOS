//
//  AttractionMapper.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import Foundation

enum AttractionMapper {
    static func map(dto: AttractionResponseDTO) -> Attraction {
        let schedule = buildSchedule(from: dto)
        return Attraction(
            uuid: dto.uuid,
            name: dto.name,
            description: dto.description ?? "",
            address: dto.address ?? "",
            images: dto.images ?? [],
            imageFormats: dto.imagesFormats ?? [],
            phone: dto.phone ?? "",
            website: dto.website ?? "",
            type: dto.type ?? "",
            rating: dto.rating ?? 0,
            status: dto.status ?? "",
            mentionedInArticlesTitles: dto.mentionedInArticlesTitles ?? [],
            supportedLanguages: dto.supportedLanguages ?? [],
            schedule: schedule
        )
    }

    private static func buildSchedule(from dto: AttractionResponseDTO) -> [DayOfWeek: DaySchedule] {
        var dict = [DayOfWeek: DaySchedule]()

        func addDay(_ day: DayOfWeek,
                    start: String?, end: String?, roundClock: Bool?, works: Bool?) {
            let startTime = (start?.isEmpty ?? true) ? nil : start
            let endTime = (end?.isEmpty ?? true) ? nil : end
            dict[day] = DaySchedule(
                startTime: (start == "-") ? nil : startTime,
                endTime: (end == "-") ? nil : endTime,
                isRoundTheClock: roundClock ?? false,
                works: works ?? false
            )
        }

        addDay(.sunday, start: dto.sundayStartTime, end: dto.sundayEndTime,
               roundClock: dto.sundayIsRoundTheClock, works: dto.worksAtSunday)
        addDay(.monday, start: dto.mondayStartTime, end: dto.mondayEndTime,
               roundClock: dto.mondayIsRoundTheClock, works: dto.worksAtMonday)
        addDay(.tuesday, start: dto.tuesdayStartTime, end: dto.tuesdayEndTime,
               roundClock: dto.tuesdayIsRoundTheClock, works: dto.worksAtTuesday)
        addDay(.wednesday, start: dto.wednesdayStartTime, end: dto.wednesdayEndTime,
               roundClock: dto.wednesdayIsRoundTheClock, works: dto.worksAtWednesday)
        addDay(.thursday, start: dto.thursdayStartTime, end: dto.thursdayEndTime,
               roundClock: dto.thursdayIsRoundTheClock, works: dto.worksAtThursday)
        addDay(.friday, start: dto.fridayStartTime, end: dto.fridayEndTime,
               roundClock: dto.fridayIsRoundTheClock, works: dto.worksAtFriday)
        addDay(.saturday, start: dto.saturdayStartTime, end: dto.saturdayEndTime,
               roundClock: dto.saturdayIsRoundTheClock, works: dto.worksAtSaturday)
        return dict
    }
}   
