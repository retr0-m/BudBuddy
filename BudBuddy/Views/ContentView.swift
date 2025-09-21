//
//  ContentView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 06.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authVM = AuthViewModel()
    @State private var selectedTab = 0
    let tabCount = 4

    var body: some View {
        Group {
            if authVM.currentUser != nil {
                TabView(selection: $selectedTab) {
                    HomeView(selectedTab: $selectedTab, tabCount: tabCount, authVM: authVM)
                        .tabItem { Label("Home", systemImage: "house.fill") }
                        .tag(0)

                    ActivitiesView(selectedTab: $selectedTab, tabCount: tabCount, authVM: authVM)
                        .tabItem { Label("Activities", systemImage: "gamecontroller.fill") }
                        .tag(1)

                    StrainsView(selectedTab: $selectedTab, tabCount: tabCount, authVM: authVM)
                        .tabItem { Label("Strains", systemImage: "leaf.fill") }
                        .tag(2)

                    ExtrasView(selectedTab: $selectedTab, tabCount: tabCount, authVM: authVM)
                        .tabItem { Label("Extras", systemImage: "sparkles") }
                        .tag(3)
                }
                .accentColor(Color.green)
                .environmentObject(authVM)
            } else {
                LoginView(authVM: authVM)
            }
        }
    }
}


// HEX color helper
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >>  8) & 0xFF) / 255
        let b = Double((rgb >>  0) & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}


#Preview {
    ContentView()
}
