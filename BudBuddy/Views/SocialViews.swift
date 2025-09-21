//
//  SocialViews.swift
//  BudBuddy
//
//  Created by Matteo Cola on 16.09.2025.
//

import SwiftUI

// MARK: - FriendsListView showing current user's friends
struct FriendsListView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var friendsData: [User] = []
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Friends")
                .font(.largeTitle)
                .bold()
            if !friendsData.isEmpty {
                ForEach(friendsData.filter { searchText.isEmpty || $0.username.localizedCaseInsensitiveContains(searchText) }, id: \.id) { friend in
                    
                    var initials: String {
                        let name = friend.username
                        let parts = name.split(separator: " ")
                        if parts.count >= 2 {
                            return "\(parts[0].first.map { String($0) } ?? "")\(parts[1].first.map { String($0) } ?? "")".uppercased()
                        } else if let first = name.first {
                            return String(first).uppercased()
                        } else {
                            return ""
                        }
                    }
                    HStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text(initials)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            )
                        Text(friend.username)
                            .font(.headline)
                        
                        Spacer()
                    }
                }
                
                
            } else {
                Text("No friends found.")
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Friends")
        .searchable(text: $searchText, prompt: "Search friends")
        .onAppear {
            Task {
                // Only fetch if not already loaded
                if let friends = authVM.currentUser?.friends {
                    var fetched: [User] = []
                    for friendId in friends {
                        if let user = await authVM.searchUserFromId(userId: friendId) {
                            fetched.append(user)
                        }
                    }
                    friendsData = fetched
                }
            }
        }
    }
}


// MARK: - ProfileView showing current user
struct ProfileView: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    var initials: String {
        let name = authVM.currentUser?.username ?? ""
        let parts = name.split(separator: " ")
        if parts.count >= 2 {
            return "\(parts[0].first.map { String($0) } ?? "")\(parts[1].first.map { String($0) } ?? "")".uppercased()
        } else if let first = name.first {
            return String(first).uppercased()
        } else {
            return ""
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            if let user = authVM.currentUser {
                // Profile image if available, else initials in circle
                ZStack {
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 100, height: 100)
                    Text(initials)
                        .font(.system(size: 38, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                }
                .padding(.top, 40)
                
                Text(user.username)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 8)
                Text(user.email ?? "")
                    .foregroundColor(.secondary)
                    .font(.title3)
                    .padding(.bottom, 8)
                // Logout button below the email
                Button(action: {
                    authVM.currentUser = nil
                    authVM.token = nil
                }) {
                    HStack {
                        Image(systemName: "power")
                            .font(.headline)
                        Text("Log Out")
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 28)
                    .padding(.vertical, 12)
                    .background(Color.red)
                    .cornerRadius(10)
                    .shadow(color: Color.red.opacity(0.2), radius: 4, x: 0, y: 2)
                }
                .padding(.top, 8)
                .accessibilityIdentifier("logoutButton")
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                    .padding(.top, 40)
                Text("Not logged in")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 16)
                Text("Please log in to see your profile details.")
                    .foregroundColor(.secondary)
                    .padding()
            }
            Spacer()
        }
        .navigationTitle("Profile")
    }
}



// MARK: - SocialButtons
struct SocialButtons: View {
    @ObservedObject var authVM: AuthViewModel
    enum ActivePage {
        case none, friends, profile
    }
    @State private var activePage: ActivePage? = .none
    var initials: String {
        let name = authVM.currentUser?.username ?? ""
        let parts = name.split(separator: " ")
        if parts.count >= 2 {
            return "\(parts[0].first.map { String($0) } ?? "")\(parts[1].first.map { String($0) } ?? "")".uppercased()
        } else if let first = name.first {
            return String(first).uppercased()
        } else {
            return ""
        }
    }
    var body: some View {
        NavigationLink(destination: FriendsListView(), tag: .friends, selection: $activePage) { EmptyView() }
        NavigationLink(destination: ProfileView(), tag: .profile, selection: $activePage) { EmptyView() }
        HStack(spacing: 4) {
            Button(action: {
                activePage = .friends
            }) {
                ZStack {
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 44, height: 44)
                        .shadow(radius: 1)
                    Image(systemName: "person.3")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: 44, height: 44)
            Button(action: {
                activePage = .profile
            }) {
                ZStack {
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 44, height: 44)
                        .shadow(radius: 1)
                    if !initials.isEmpty {
                        Text(initials)
                            .font(.headline)
                            .foregroundColor(.primary)
                    } else {
                        Image(systemName: "person.fill")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width: 44, height: 44)
        }
    }
}




// MARK: - Notifications

struct GrayBackgroundButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(configuration.isPressed ? Color.gray : Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct FriendRequestRow: View {
    var user: User
    var acceptAction: () -> Void
    
    var initials: String {
        let name = user.username
        let parts = name.split(separator: " ")
        if parts.count >= 2 {
            return "\(parts[0].first.map { String($0) } ?? "")\(parts[1].first.map { String($0) } ?? "")".uppercased()
        } else if let first = name.first {
            return String(first).uppercased()
        } else {
            return ""
        }
    }
    var body: some View {
        
        HStack {
            Circle()
                .fill(Color.green)
                .frame(width: 40, height: 40)
                .overlay(
                    Text(initials)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                )
            Text(user.username)
                .font(.headline)
            
            Spacer()
        
            Button("Accept") {
                acceptAction()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct SearchResultRow: View {
    var user: User
    var currentUser: User?    // <-- pass current user in
    var addAction: () -> Void

    @State private var buttonStatus: String = "Add"
    @State private var isDisabled: Bool = false

    var body: some View {
        let isFriend = currentUser?.friends?.contains(user.id) ?? false
        let hasSentRequest = user.friendRequests?.contains(currentUser?.id ?? "")
        let hasReceivedRequest = currentUser?.friendRequests?.contains(user.id) ?? false

        // Initialize state on appear
        HStack {
            Text(user.username)
            Spacer()
            if !isFriend {
                Button(buttonStatus) {
                    // Optimistically update UI
                    buttonStatus = "Sent"
                    isDisabled = true
                    addAction()
                }
                .buttonStyle(GrayBackgroundButtonStyle())
                .disabled(isDisabled || hasSentRequest ?? false || hasReceivedRequest)
                .opacity((isDisabled || hasSentRequest ?? false || hasReceivedRequest) ? 0.5 : 1.0)
            }
        }
        .onAppear {
            if isFriend {
                buttonStatus = "Friends"
                isDisabled = true
            } else if hasSentRequest ?? false {
                buttonStatus = "Sent"
                isDisabled = true
            } else if hasReceivedRequest {
                buttonStatus = "Sent"
                isDisabled = true
            } else {
                buttonStatus = "Add"
                isDisabled = false
            }
        }
    }
}

struct NotificationsView: View {
    @ObservedObject var authVM: AuthViewModel
    @State private var friendRequests: [User] = []   // <-- FIXED: var not let
    @State private var searchResults: [User] = []
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                HStack {
                    TextField("Search friends by username", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                    Button("Search") {
                        Task {
                            searchResults = await authVM.searchUsers(username: searchText)
                        }
                    }
                    Spacer()
                }
                .padding()

                // Show search results
                if !searchResults.isEmpty {
                    List(searchResults, id: \.id) { user in
                        if user.username != authVM.currentUser?.username.lowercased() {
                            SearchResultRow(user: user, currentUser: authVM.currentUser) {
                                Task {
                                    await authVM.sendFriendRequest(userId: user.id)
                                    print("Sending friend request to user with id:", user.id)
                                }
                            }
                        }
                    }
                }

                Divider().padding(.vertical)

                // Friend requests
                List {
                    ForEach(friendRequests, id: \.id) { user in
                        FriendRequestRow(user: user) {
                            Task {
                                await authVM.acceptFriendRequest(userId: user.id)
                                friendRequests.removeAll { $0.id == user.id }
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Friend Requests")
            .onAppear {
                Task {
                    friendRequests = await authVM.fetchFriendRequests()
                    print("Loaded friend requests:", friendRequests)
                }
            }
        }
    }
}

struct NotificationsButton: View {
    @ObservedObject var authVM: AuthViewModel
    var body: some View {
        NavigationLink(destination: NotificationsView(authVM: authVM)) {
            Image(systemName: "bell.fill")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding(10)
                .background(
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 44, height: 44)
                        .shadow(radius: 1)
                )
        }
    }
}
