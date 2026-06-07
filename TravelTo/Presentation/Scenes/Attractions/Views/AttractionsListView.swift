//
//  AttractionsListView.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 07.05.2026.
//

import SwiftUI

struct AttractionsListView: View {
    @EnvironmentObject var env: AppEnvironment
    @StateObject private var viewModel: AttractionsFetchViewModel

    init(viewModel: AttractionsFetchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.attractions.isEmpty {
                    ProgressView()
                        .task { await viewModel.load() }
                } else {
                    VStack(spacing: 16) {
                        ForEach(viewModel.attractions, id: \.uuid) { attraction in
                            NavigationLink {
                                AttractionDetailView(attractionName: attraction.name, env: env)
                            } label: {
                                AttractionCardView(attraction: attraction)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Attractions")
            .task { if viewModel.attractions.isEmpty { await viewModel.load() } }
        }
    }
}
