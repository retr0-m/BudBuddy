//
//  BudBuddyTests.swift
//  BudBuddyTests
//
//  Created by Matteo Cola on 06.09.2025.
//

import XCTest
@testable import BudBuddy

final class BudBuddyTests: XCTestCase {
    var authVM: AuthViewModel!

    override func setUp() async throws {
        await MainActor.run {
            authVM = AuthViewModel() // Initialize on main actor
        }
    }

    override func tearDown() async throws {
        await MainActor.run {
            authVM = nil
        }
    }

    func testLoginAndSearchFriend() async throws {
        // 1. Login
        let loginSuccess = await authVM.login(email: "matteo.cola@hotmail.com", password: "Retr01..")
        XCTAssertTrue(loginSuccess, "Login should succeed")

        await MainActor.run {
            XCTAssertNotNil(authVM.currentUser, "Current user should be set after login")
            XCTAssertNotNil(authVM.token, "Token should be set after login")
        }

        // 2. Search users
        let results = await authVM.searchUsers(username: "a")
        XCTAssertFalse(results.isEmpty, "Search results should not be empty")

        await MainActor.run {
            for user in results {
                print("Found user: \(user.username) - \(user.email) - id: \(user.id)")
            }
        }
    }
}
