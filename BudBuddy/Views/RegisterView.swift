//
//  RegisterView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 15.09.2025.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var authVM: AuthViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var username = ""
    @State private var email = ""
    @State private var password = ""

    @State private var usernameError: String?
    @State private var emailError: String?
    @State private var passwordError: String?
    @State private var generalError: String?

    var body: some View {
        ZStack {
            // Background layers
            ReactiveBackgroundView(weedType: .hybrid, mood: nil)
            FloatingMoodBackground(weedType: .indica, mood: nil)
            
            VStack(spacing: 24) {
                if let generalError = generalError {
                    Text(generalError)
                        .foregroundColor(.red)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 4)
                }
                Text("Register")
                    .font(.largeTitle)
                // Username input
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.white.opacity(0.7))
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.white.opacity(0.25))
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                )
                if let usernameError = usernameError {
                    Text(usernameError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 4)
                }

                // Email input
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.white.opacity(0.7))
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.white.opacity(0.25))
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                )
                if let emailError = emailError {
                    Text(emailError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 4)
                }

                // Password input
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.white.opacity(0.7))
                    SecureField("Password", text: $password)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.white.opacity(0.25))
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                )
                if let passwordError = passwordError {
                    Text(passwordError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 4)
                }

                // Register button
                Button(action: {
                    // Clear previous errors
                    generalError = nil
                    usernameError = nil
                    emailError = nil
                    passwordError = nil

                    // Input validation
                    var isValid = true
                    if username.trimmingCharacters(in: .whitespacesAndNewlines).count < 3 {
                        usernameError = "Username must be at least 3 characters."
                        isValid = false
                    }
                    // Email regex validation
                    let emailRegex = #"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$"#
                    let predicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
                    if !predicate.evaluate(with: email) {
                        emailError = "Please enter a valid email address."
                        isValid = false
                    }
                    if password.count < 6 {
                        passwordError = "Password must be at least 6 characters."
                        isValid = false
                    }
                    guard isValid else { return }

                    Task {
                        let success = await authVM.register(username: username, email: email, password: password)
                        if success {
                            dismiss()
                        } else {
                            generalError = "Registration failed. Please try again."
                        }
                    }
                }) {
                    Text("Register")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(16)
                        .shadow(color: Color.accentColor.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                .padding(.top, 8)

                // Cancel button
                Button(action: {
                    dismiss()
                }) {
                    Text("Cancel")
                        .fontWeight(.medium)
                        .foregroundColor(.accentColor)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white.opacity(0.22))
                        .cornerRadius(16)
                }
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 32)
        }
        .ignoresSafeArea()
    }
}
