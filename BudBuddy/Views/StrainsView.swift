//
//  StrainsView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 06.09.2025.
//

import SwiftUI



struct StrainsView: View {
    
    @Binding var selectedTab: Int
    let tabCount: Int
    @ObservedObject var authVM: AuthViewModel  
    
    @State private var strains: [Strain] = loadStrainsFromJSON()
    @State private var searchText: String = ""
    @State private var selectedType: String = "All"
    
    let types = ["All", "Indica", "Sativa", "Hybrid"]
    
    var filteredStrains: [Strain] {
        strains.filter { strain in
            (selectedType == "All" || strain.type.lowercased() == selectedType.lowercased()) &&
            (searchText.isEmpty || strain.name.lowercased().contains(searchText.lowercased()))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search strains...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                
                // Type filter
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(types, id: \.self) { type in
                            Text(type)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(selectedType == type ? Color.green.opacity(0.3) : Color.gray.opacity(0.2))
                                .cornerRadius(12)
                                .onTapGesture { selectedType = type }
                        }
                    }
                    .padding(.horizontal)
                }
                
                List(filteredStrains) { strain in
                    NavigationLink(destination: StrainDetailView(strain: strain)) {
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(strain.name)
                                        .font(.headline)
                                    Text(strain.type)
                                        .font(.subheadline)
                                        .foregroundColor(colorForType(strain.type))
                                }
                                Spacer()
                                Text(String(format: "%.1f", strain.rating))
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(colorForRating(strain.rating))
                            }
                            // Effects tags
                            if !strain.effects.isEmpty {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(strain.effects, id: \.self) { effect in
                                            TagView(text: effect, color: colorForString(effect))
                                        }
                                    }
                                }
                            }
                            // Flavors tags
                            if !strain.flavors.isEmpty {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(strain.flavors, id: \.self) { flavor in
                                            TagView(text: flavor, color: colorForString(flavor))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Strains")
        }
    }
}

struct StrainDetailView: View {
    let strain: Strain
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Card-like header with name and rating
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(strain.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(strain.type)
                            .font(.title2)
                            .foregroundColor(colorForType(strain.type))
                    }
                    Spacer()
                    Text(String(format: "%.1f", strain.rating))
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(colorForRating(strain.rating))
                        .padding(.top, 4)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(UIColor.secondarySystemBackground))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                )
                
                // Effects tags
                if !strain.effects.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Effects:")
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(strain.effects, id: \.self) { effect in
                                    TagView(text: effect, color: colorForString(effect))
                                }
                            }
                        }
                    }
                }
                
                // Flavors tags
                if !strain.flavors.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Flavors:")
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(strain.flavors, id: \.self) { flavor in
                                    TagView(text: flavor, color: colorForString(flavor))
                                }
                            }
                        }
                    }
                }
                
                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description:")
                        .bold()
                    Text(strain.description.joined(separator: ", "))
                        .font(.body)
                        .foregroundColor(.primary)
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle(strain.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - TagView for effects/flavors
struct TagView: View {
    let text: String
    let color: Color
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .cornerRadius(8)
    }
}

// MARK: - Helper functions for color logic
func colorForType(_ type: String) -> Color {
    switch type.lowercased() {
    case "indica":
        return Color.purple
    case "sativa":
        return Color.orange
    case "hybrid":
        return Color.green
    default:
        return Color.gray
    }
}

func colorForRating(_ rating: Double) -> Color {
    if rating >= 4.0 {
        return .green
    } else if rating >= 2.5 {
        return .yellow
    } else {
        return .red
    }
}

func colorForString(_ string: String) -> Color {
    // Generate a consistent color based on the hash of the string
    let colors: [Color] = [
        .red, .orange, .yellow, .green, .blue, .purple, .pink, .teal, .indigo, .mint, .cyan
    ]
    let hash = abs(string.hashValue)
    let index = hash % colors.count
    return colors[index]
}
