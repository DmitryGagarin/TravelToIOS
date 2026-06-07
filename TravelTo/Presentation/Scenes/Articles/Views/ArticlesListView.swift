//
//  ArticlesListView.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 06.05.2026.
//

import SwiftUI

struct ArticlesListView: View {
    @StateObject private var viewModel: ArticlesListViewModel

    init(viewModel: ArticlesListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            List(viewModel.articles, id: \.uuid) { article in
                VStack(alignment: .leading) {
                    Text(article.title).font(.headline)
                    Text(article.author).font(.subheadline)
                }
            }
            .navigationTitle("Articles")
            .task { await viewModel.load() }
            .alert("Error", isPresented: Binding(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Button("OK") {}
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
    }
}
