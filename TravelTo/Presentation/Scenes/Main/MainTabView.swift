//
//  MainTabView.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 07.05.2026.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var env: AppEnvironment

    var body: some View {
        TabView {
            // Attractions
            NavigationView {
                AttractionsListView(viewModel: env.makeAttractionsFetchViewModel())
            }
            .tabItem {
                Label("Attractions", systemImage: "mappin.and.ellipse")
            }

            // Articles
            NavigationView {
                ArticlesListView(viewModel: env.makeArticlesListViewModel())
            }
            .tabItem {
                Label("Articles", systemImage: "doc.text")
            }

            // Profile
            NavigationView {
                ProfileView(
                    fetchVM: env.makeCurrentUserFetchViewModel(),
                    saveVM: env.makeSaveProfileChangesViewModel(),
                    deleteVM: env.makeCurrentUserDeleteViewModel()
                )
                .environmentObject(env)
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}
