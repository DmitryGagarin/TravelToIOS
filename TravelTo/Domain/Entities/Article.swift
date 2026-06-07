//
//  Article.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 05.05.2026.
//

import Foundation

struct Article {
    let uuid: String
    let title: String
    let content: String
    let author: String
    let mentionedAttractions: [String]
    let createdAt: Date
    let updatedAt: Date
}
