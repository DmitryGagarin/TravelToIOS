//
//  AttractionCardView.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 07.05.2026.
//

import SwiftUI

struct AttractionCardView: View {
    let attraction: Attraction

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Изображения с авто-скроллом
            if !attraction.images.isEmpty {
                TabView {
                    ForEach(attraction.images, id: \.self) { base64 in
                        Base64Image(base64String: base64)
                            .clipped()
                    }
                }
                .tabViewStyle(.page)
                .frame(height: 200)
                .cornerRadius(12)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                    .overlay(Image(systemName: "photo").font(.largeTitle).foregroundColor(.gray))
            }

            Text(attraction.name)
                .font(.headline)
                .lineLimit(2)

            Text(attraction.type.capitalized)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
    }
}
