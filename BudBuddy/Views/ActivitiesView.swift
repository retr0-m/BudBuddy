//
//  ActivitiesView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 06.09.2025.
//

import SwiftUI

struct ActivitiesView: View {
    
    @Binding var selectedTab: Int
    let tabCount: Int
    @ObservedObject var authVM: AuthViewModel
    
    
    
    @State private var mostQuotedActivitiesList: [Activity] = mostQuotedActivities
    @State private var lastCreatedActivitiesList: [Activity] = lastCreatedActivities
    @State private var favoriteActivitiesList: [Activity] = favoriteActivities
    @State private var createdActivitiesList: [Activity] = createdActivities
    @State private var likedActivityIDs: Set<UUID> = []
    @State private var searchText: String = ""
    @State private var selectedTags: Set<String> = []
    @State private var showingCreateActivity = false
    private var availableTags: [String] {
        let allTags = mostQuotedActivitiesList.flatMap { $0.tags } +
                      lastCreatedActivitiesList.flatMap { $0.tags } +
                      favoriteActivitiesList.flatMap { $0.tags } +
                      createdActivitiesList.flatMap { $0.tags }
        return Array(Set(allTags)).sorted()
    }
    
    @State private var likeButtonPressedID: UUID?
    @State private var favoriteButtonPressedID: UUID?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("You bored, huh?")
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                
                
                
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search activities...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // Tag filter bar
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(availableTags, id: \.self) { tag in
                            Text(tag)
                                .font(.caption)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(selectedTags.contains(tag) ? Color.blue.opacity(0.3) : Color.gray.opacity(0.2))
                                .foregroundColor(selectedTags.contains(tag) ? .blue : .primary)
                                .cornerRadius(12)
                                .onTapGesture {
                                    if selectedTags.contains(tag) {
                                        selectedTags.remove(tag)
                                    } else {
                                        selectedTags.insert(tag)
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                }
                
                
                if !filteredSavedActivities.isEmpty || !filteredMostQuotedActivitiesList.isEmpty || !filteredLastCreatedActivitiesList.isEmpty || !filteredCreatedActivitiesList.isEmpty {
                    List {
                        if !filteredSavedActivities.isEmpty {
                            Section(header: sectionHeader(text: "Your Favorites", icon: "bookmark.fill", color: Color.red.opacity(0.3))) {
                                ForEach(filteredSavedActivities, id: \.id) { activity in
                                    if let index = favoriteActivitiesList.firstIndex(where: { $0.id == activity.id }) {
                                        NavigationLink(destination: ActivityDetailView(activity: favoriteActivitiesList[index])) {
                                            activityRow(activity: $favoriteActivitiesList[index])
                                        }
                                    }
                                }
                            }
                        }
                        if !filteredMostQuotedActivitiesList.isEmpty {
                            Section(header: sectionHeader(text: "Most Quoted Activities", icon: "star.fill", color: Color.yellow.opacity(0.3))) {
                                ForEach(filteredMostQuotedActivitiesList, id: \.id) { activity in
                                    if let index = mostQuotedActivitiesList.firstIndex(where: { $0.id == activity.id }) {
                                        NavigationLink(destination: ActivityDetailView(activity: mostQuotedActivitiesList[index])) {
                                            activityRow(activity: $mostQuotedActivitiesList[index])
                                        }
                                    }
                                }
                            }
                        }
                        if !filteredLastCreatedActivitiesList.isEmpty {
                            Section(header: sectionHeader(text: "Last Created", icon: "clock.fill", color: Color.blue.opacity(0.3))) {
                                ForEach(filteredLastCreatedActivitiesList, id: \.id) { activity in
                                    if let index = lastCreatedActivitiesList.firstIndex(where: { $0.id == activity.id }) {
                                        NavigationLink(destination: ActivityDetailView(activity: lastCreatedActivitiesList[index])) {
                                            activityRow(activity: $lastCreatedActivitiesList[index])
                                        }
                                    }
                                }
                            }
                        }
                        if !filteredCreatedActivitiesList.isEmpty {
                            Section(header: sectionHeader(text: "Your Created Activities", icon: "paintpalette.fill", color: Color.purple.opacity(0.3))) {
                                ForEach(filteredCreatedActivitiesList, id: \.id) { activity in
                                    if let index = createdActivitiesList.firstIndex(where: { $0.id == activity.id }) {
                                        NavigationLink(destination: ActivityDetailView(activity: createdActivitiesList[index])) {
                                            activityRow(activity: $createdActivitiesList[index])
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                    Button(action: {
                        showingCreateActivity = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.green)
                    }
                    .buttonStyle(PlainButtonStyle())

                    .sheet(isPresented: $showingCreateActivity) {
                        CreateActivityView { newActivity in
                            createdActivitiesList.append(newActivity)
                        }
                    }
                    .padding(.trailing)
                } else {
                    Text("No activities available")
                        .font(.headline)
                        .padding()
                }
            }
        }
    }
    
    private func sectionHeader(text: String, icon: String, color: Color) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
            Text(text)
                .font(.headline)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 4)
        .padding(.horizontal)
        .background(color)
        .cornerRadius(8)
    }
    
    // MARK: - Filtering
    
    private func matchesSearch(_ activity: Activity) -> Bool {
        guard !searchText.isEmpty else { return true }
        let text = searchText.lowercased()
        return activity.title.lowercased().contains(text) || activity.subtitle.lowercased().contains(text)
    }
    
    private func matchesTags(_ activity: Activity) -> Bool {
        guard !selectedTags.isEmpty else { return true }
        return !selectedTags.isDisjoint(with: activity.tags)
    }
    
    private var filteredSavedActivities: [Activity] {
        favoriteActivitiesList.filter { activity in
            (likedActivityIDs.contains(activity.id) || activity.isFavorite) && matchesSearch(activity) && matchesTags(activity)
        }
    }
    
    private var filteredMostQuotedActivitiesList: [Activity] {
        mostQuotedActivitiesList.filter { activity in
            matchesSearch(activity) && matchesTags(activity)
        }
    }
    private var filteredLastCreatedActivitiesList: [Activity] {
        lastCreatedActivitiesList.filter { activity in
            matchesSearch(activity) && matchesTags(activity)
        }
    }
    private var filteredCreatedActivitiesList: [Activity] {
        createdActivitiesList.filter { activity in
            matchesSearch(activity) && matchesTags(activity)
        }
    }
    
    // MARK: - Activity Row
    
    private func activityRow(activity: Binding<Activity>) -> some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 6) {
                Text(activity.wrappedValue.title)
                    .fontWeight(.bold)
                Text("\(activity.wrappedValue.likes) users have done this activity")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                activityTagsView(activity: activity.wrappedValue)
            }
            Spacer()
            HStack(spacing: 14) {
                activityLikeButton(activity: activity)
                activityFavoriteButton(activity: activity)
            }
            .padding(.top, 2)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .background(Color.clear)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
    
    private func activityTagsView(activity: Activity) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                ForEach(activity.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.2))
                        .foregroundColor(Color.green.darken(amount: 0.3))
                        .cornerRadius(8)
                }
            }
            .padding(.vertical, 2)
        }
    }
    
    private func activityLikeButton(activity: Binding<Activity>) -> some View {
        Button(action: {
            let id = activity.wrappedValue.id
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                if likedActivityIDs.contains(id) {
                    activity.likes.wrappedValue -= 1
                    likedActivityIDs.remove(id)
                } else {
                    activity.likes.wrappedValue += 1
                    likedActivityIDs.insert(id)
                }
            }
            likeButtonPressedID = id
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                likeButtonPressedID = nil
            }
        }) {
            HStack(spacing: 4) {
                Image(systemName: likedActivityIDs.contains(activity.wrappedValue.id) ? "hand.thumbsup.fill" : "hand.thumbsup")
                Text("\(activity.wrappedValue.likes)")
            }
            .font(.subheadline)
            .foregroundColor(likedActivityIDs.contains(activity.wrappedValue.id) ? .blue : .primary)
            .scaleEffect(likeButtonPressedID == activity.wrappedValue.id ? 1.2 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: likedActivityIDs)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
    
    private func activityFavoriteButton(activity: Binding<Activity>) -> some View {
        Button(action: {
            let id = activity.wrappedValue.id
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                // Toggle isFavorite for this activity and all instances of it in all lists
                let newValue = !activity.isFavorite.wrappedValue
                activity.isFavorite.wrappedValue = newValue
                
                // Update all instances in mostQuotedActivitiesList
                for index in mostQuotedActivitiesList.indices {
                    if mostQuotedActivitiesList[index].id == id {
                        mostQuotedActivitiesList[index].isFavorite = newValue
                    }
                }
                // Update all instances in lastCreatedActivitiesList
                for index in lastCreatedActivitiesList.indices {
                    if lastCreatedActivitiesList[index].id == id {
                        lastCreatedActivitiesList[index].isFavorite = newValue
                    }
                }
                // Update all instances in createdActivitiesList
                for index in createdActivitiesList.indices {
                    if createdActivitiesList[index].id == id {
                        createdActivitiesList[index].isFavorite = newValue
                    }
                }
                // Update all instances in favoriteActivitiesList
                for index in favoriteActivitiesList.indices {
                    if favoriteActivitiesList[index].id == id {
                        favoriteActivitiesList[index].isFavorite = newValue
                    }
                }
                
                if newValue {
                    if !favoriteActivitiesList.contains(where: { $0.id == id }) {
                        favoriteActivitiesList.append(activity.wrappedValue)
                    }
                } else {
                    if let index = favoriteActivitiesList.firstIndex(where: { $0.id == id }) {
                        favoriteActivitiesList.remove(at: index)
                    }
                }
            }
            favoriteButtonPressedID = id
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                favoriteButtonPressedID = nil
            }
        }) {
            Image(systemName: activity.isFavorite.wrappedValue ? "heart.fill" : "heart")
                .foregroundColor(activity.isFavorite.wrappedValue ? .red : .secondary)
                .font(.subheadline)
                .scaleEffect(favoriteButtonPressedID == activity.wrappedValue.id ? 1.2 : 1.0)

        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

private extension Color {
    func darken(amount: Double) -> Color {
        let uiColor = UIColor(self)
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return Color(hue: Double(hue), saturation: Double(saturation), brightness: Double(max(brightness - CGFloat(amount), 0)), opacity: Double(alpha))
    }
}
