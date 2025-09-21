//
//  LoginView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 14.09.2025.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showRegister = false
    @State private var errorMessage: String?
    @State private var emailError: String?
    @State private var passwordError: String?

    var body: some View {
        ZStack {
            ReactiveBackgroundView(weedType: .indica, mood: nil)
            FloatingMoodBackground(weedType: .indica, mood: nil)

            VStack(spacing: 24) {
                Spacer().frame(height: 120)

                Text("Welcome Back")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                }

                VStack(spacing: 16) {
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.secondary)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(Color.white.opacity(0.25))
                    .cornerRadius(12)
                    if let emailError = emailError {
                        Text(emailError)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.horizontal, 32)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.secondary)
                        SecureField("Password", text: $password)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(Color.white.opacity(0.25))
                    .cornerRadius(12)
                    if let passwordError = passwordError {
                        Text(passwordError)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.horizontal, 32)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.horizontal, 32)

                Button(action: {
                    errorMessage = nil
                    emailError = nil
                    passwordError = nil

                    var isValid = true

                    if !isValidEmail(email) {
                        emailError = "Please enter a valid email address."
                        isValid = false
                    }

                    if password.count < 6 {
                        passwordError = "Password must be at least 6 characters."
                        isValid = false
                    }

                    guard isValid else { return }

                    Task {
                        let success = await authVM.login(email: email, password: password)
                        if !success {
                            errorMessage = "Login failed. Please check your credentials and try again."
                        }
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green.opacity(0.85))
                        .cornerRadius(12)
                }
                .padding(.horizontal, 32)

                Button("Register") {
                    showRegister = true
                }
                .foregroundColor(.secondary)
                .padding(.top, 4)
                .sheet(isPresented: $showRegister) {
                    RegisterView(authVM: authVM)
                }

                Spacer()
            }
        }
        .accentColor(Color.green)
        .ignoresSafeArea()
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: email)
    }
}
