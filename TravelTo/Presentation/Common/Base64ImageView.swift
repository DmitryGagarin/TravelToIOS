//
//  Base64ImageView.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 07.05.2026.
//

import SwiftUI

struct Base64Image: View {
    let base64String: String
    var placeholder: Image = Image(systemName: "photo")

    var body: some View {
        if let data = Data(base64Encoded: base64String),
           let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
        } else {
            placeholder
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
        }
    }
}
