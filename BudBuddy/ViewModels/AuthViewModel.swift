//
//  AuthViewModel.swift
//  BudBuddy
//
//  Created by Matteo Cola on 14.09.2025.
//

import Foundation
import SwiftUI

@MainActor
class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var token: String?

    func register(username: String, email: String, password: String) async -> Bool {
        guard let url = URL(string: "http://localhost:8080/api/auth/register") else { return false }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: ["username": username, "email": email, "password": password])

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 {
                let decoded = try JSONDecoder().decode(AuthResponse.self, from: data)
                self.currentUser = decoded.user
                self.token = decoded.token
                return true
            } else {
                return false
            }
        } catch {
            print("Registration error:", error)
            return false
        }
    }

    func login(email: String, password: String) async -> Bool {
        guard let url = URL(string: "http://localhost:8080/api/auth/login") else { return false }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: ["email": email, "password": password])

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let decoded = try JSONDecoder().decode(AuthResponse.self, from: data)
                self.currentUser = decoded.user
                self.token = decoded.token
                return true
            } else {
                return false
            }
        } catch {
            print("Login error:", error)
            return false
        }
    }
}


extension AuthViewModel {

    // Fetch incoming friend requests
    @MainActor
    func fetchFriendRequests() async -> [User] {
        guard let token = token else { return [] }
        guard let url = URL(string: "http://localhost:8080/api/friends/requests") else { return [] }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            if let raw = String(data: data, encoding: .utf8) {
                print("Raw response:", raw) // debug to verify JSON
            }
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            print("Failed to fetch friend requests:", error)
            return []
        }
    }

    // Search users by username
    @MainActor
    func searchUsers(username: String) async -> [User] {
        guard let token = token else { return [] }
        
        var components = URLComponents(string: "http://localhost:8080/api/friends/search")!
        components.queryItems = [URLQueryItem(name: "username", value: username)]
        
        var request = URLRequest(url: components.url!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            if let raw = String(data: data, encoding: .utf8) {
                print("Search raw response:", raw)
            }
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            print("Search users failed:", error)
            return []
        }
    }

    // Send friend request
    @MainActor
    func sendFriendRequest(userId: String) async {
        guard let token = token else { return }
        guard let url = URL(string: "http://localhost:8080/api/friends/request/\(userId)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print("Friend request sent:", data)
        } catch {
            print("Failed to send friend request:", error)
        }
    }
    
    // Search user by userId
    @MainActor
    func searchUserFromId(userId: String) async -> User? {
        guard let token = token else { return nil }
        guard let url = URL(string: "http://localhost:8080/api/friends/user/\(userId)") else { return nil }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(User.self, from: data)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type mismatch error for type \(type):", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch {
            print("Failed to fetch user by id:", error)
            return nil
        }
    }
    
    @MainActor
    func acceptFriendRequest(userId: String) async {
        print("accepting friend request of:", userId)
        guard let token = token else { return }
        guard let url = URL(string: "http://localhost:8080/api/friends/accept/\(userId)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let errorMessage = String(data: data, encoding: .utf8) ?? "Unknown error"
                print("Accept failed: \(errorMessage)")
                return
            }

            if let raw = String(data: data, encoding: .utf8) {
                print("Accept success response:", raw)
            }

            // Update local user model if needed
            if var current = currentUser {
                current.friends?.append(userId)
                currentUser = current
            }
        } catch {
            print("Accept friend request error:", error)
        }
    }
}
