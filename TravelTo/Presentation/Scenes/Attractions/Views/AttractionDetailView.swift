//
//  AttractionDetailView.swift
//  TravelTo
//
//  Created by Dmitry Fatsievich on 07.05.2026.
//

import SwiftUI

struct AttractionDetailView: View {
    let attractionName: String
    @EnvironmentObject var env: AppEnvironment

    @StateObject private var attractionVM: AttractionFetchViewModel
    @StateObject private var discussionsVM: DiscussionsFetchViewModel
    @StateObject private var createDiscussionVM: DiscussionCreateViewModel

    init(attractionName: String, env: AppEnvironment) {
        self.attractionName = attractionName
        _attractionVM = StateObject(wrappedValue: env.makeAttractionFetchViewModel())
        _discussionsVM = StateObject(wrappedValue: env.makeDiscussionsFetchViewModel())
        _createDiscussionVM = StateObject(wrappedValue: env.makeDiscussionCreateViewModel())
    }

    var body: some View {
        ScrollView {
            if let attraction = attractionVM.attraction {
                VStack(alignment: .leading, spacing: 16) {
                    // Галерея изображений
                    if !attraction.images.isEmpty {
                        TabView {
                            ForEach(attraction.images, id: \.self) { base64 in
                                Base64Image(base64String: base64)
                                    .scaledToFill()
                                    .clipped()
                            }
                        }
                        .tabViewStyle(.page)
                        .frame(height: 250)
                        .cornerRadius(16)
                    }

                    Text(attraction.name)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(attraction.type.capitalized)
                        .font(.headline)
                        .foregroundColor(.secondary)

                    if !attraction.description.isEmpty {
                        Text(attraction.description)
                            .font(.body)
                    }

                    Divider()

                    // Контакты
                    Group {
                        if !attraction.phone.isEmpty {
                            HStack { Image(systemName: "phone"); Text(attraction.phone) }
                        }
                        if !attraction.website.isEmpty {
                            HStack { Image(systemName: "link"); Text(attraction.website) }
                        }
                        if !attraction.address.isEmpty {
                            HStack { Image(systemName: "mappin.and.ellipse"); Text(attraction.address) }
                        }
                    }
                    .font(.callout)

                    // Расписание
                    if !attraction.schedule.isEmpty {
                        Divider()
                        Text("Working Hours")
                            .font(.headline)
                        ForEach(DayOfWeek.allCases, id: \.self) { day in
                            if let schedule = attraction.schedule[day] {
                                HStack {
                                    Text(day.rawValue.capitalized)
                                        .frame(width: 100, alignment: .leading)
                                    if schedule.works {
                                        if schedule.isRoundTheClock {
                                            Text("Round the clock")
                                        } else if let start = schedule.startTime, let end = schedule.endTime {
                                            Text("\(start) - \(end)")
                                        } else {
                                            Text("Open")
                                        }
                                    } else {
                                        Text("Closed")
                                    }
                                }
                                .font(.callout)
                            }
                        }
                    }

                    Divider()

                    // Отзывы (обсуждения)
                    Text("Leave Comment")
                        .font(.title2.bold())

                    DiscussionFormView(viewModel: createDiscussionVM, attractionName: attractionName)

                    Divider()

                    Text("Comments")
                        .font(.title2.bold())

                    if discussionsVM.discussions.isEmpty {
                        Text("No comments yet.")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(discussionsVM.discussions, id: \.author) { discussion in
                            DiscussionRow(discussion: discussion)
                        }
                    }

                    Spacer()
                }
                .padding()
            } else if let error = attractionVM.errorMessage {
                Text("Error: \(error)").foregroundColor(.red)
            } else {
                ProgressView()
            }
        }
        .navigationTitle(attractionVM.attraction?.name ?? "Attraction")
        .task {
            await attractionVM.load(name: attractionName)
            await discussionsVM.load(attractionName: attractionName)
        }
    }
}

// Строка одного обсуждения
struct DiscussionRow: View {
    let discussion: AttractionDiscussion

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(discussion.author).fontWeight(.semibold)
                Spacer()
                Text("Rating: \(Int(discussion.rating))/5")
            }
            Text(discussion.title).font(.headline)
            Text("Liked: \(discussion.contentLike)")
            Text("Disliked: \(discussion.contentDislike)")
            Text(discussion.content)
            Divider()
        }
    }
}

// Простая форма создания обсуждения (без изображений)
struct DiscussionFormView: View {
    @ObservedObject var viewModel: DiscussionCreateViewModel
    let attractionName: String

    @State private var title = ""
    @State private var contentLike = ""
    @State private var contentDislike = ""
    @State private var content = ""
    @State private var rating = 3

    var body: some View {
        VStack(spacing: 12) {
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
            TextField("What you liked?", text: $contentLike)
                .textFieldStyle(.roundedBorder)
            TextField("What you disliked?", text: $contentDislike)
                .textFieldStyle(.roundedBorder)
            TextField("Overall", text: $content)
                .textFieldStyle(.roundedBorder)
            HStack {
                Text("Mark: \(rating)")
                Stepper("", value: $rating, in: 1...5)
            }
            Button("Submit discussion") {
                let request = CreateAttractionDiscussionRequest(
                    title: title,
                    contentLike: contentLike,
                    contentDislike: contentDislike,
                    content: content,
                    rating: Double(rating)
                )
                Task {
                    await viewModel.load(
                        request: request,
                        images: [],           // позже добавим выбор фото
                        attractionName: attractionName
                    )
                    // очистка полей
                    title = ""; contentLike = ""; contentDislike = ""; content = ""; rating = 3
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(title.isEmpty || content.isEmpty)
        }
    }
}
