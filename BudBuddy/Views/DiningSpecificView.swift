//
//  DiningSpecificView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 09.09.2025.
//

import SwiftUI


struct DiningSpecificView: View {
    let recipe: CannabisRecipe
    @State private var showCalculator: Bool = false
    
    var body: some View {
        ZStack {
            // Background
            MovingFlamesBackground()
            LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.65), Color.cyan.opacity(0.35)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .blendMode(.plusLighter)
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    DisclosureGroup("Calculate Cannabis Dosage", isExpanded: $showCalculator) {
                        WeedStrenghtCalculator(HideComsumptionMethod: true)
                            .padding(.top, 8)
                    }
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Title
                    Text(recipe.title)
                        .font(.largeTitle).bold()
                        .foregroundColor(.primary)
                        .padding(.top, 12)
                        .padding(.bottom, 4)
                    
                    // Prep/Cook Time & Difficulty
                    HStack(spacing: 24) {
                        HStack(spacing: 6) {
                            Image(systemName: "clock")
                                .foregroundColor(.red)
                            Text("\(recipe.prepTime) + \(recipe.cookTime)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        HStack(spacing: 6) {
                            Image(systemName: "flame.fill")
                                .foregroundColor(.red)
                            Text(recipe.difficulty)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.bottom, 4)
                    HStack{
                        Text("Servings: ")
                            .font(.subheadline)
                        Text(String(recipe.servings))
                        
                    }
                    // Ingredients Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Ingredients")
                            .font(.title2).bold()
                            .padding(.bottom, 2)
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(recipe.ingredients, id: \.self) { ingredient in
                                Text(ingredient)
                                    .font(.body)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(Color.white.opacity(0.2))
                                    .cornerRadius(14)
                                    .shadow(color: Color.black.opacity(0.08), radius: 3, x: 0, y: 2)
                            }
                        }
                    }
                    
                    // Instructions Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Instructions")
                            .font(.title2).bold()
                            .padding(.bottom, 2)
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { idx, step in
                                HStack(alignment: .top, spacing: 10) {
                                    Text("\(idx + 1).")
                                        .font(.headline)
                                        .foregroundColor(.red)
                                        .padding(.top, 2)
                                    Text(step)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 12)
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.10), radius: 4, x: 0, y: 2)
                            }
                        }
                    }
                    
                    // Flavors Section
                    if !recipe.flavors.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Flavors")
                                .font(.title3).bold()
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(recipe.flavors, id: \.self) { flavor in
                                        Text(flavor)
                                            .font(.subheadline)
                                            .padding(.horizontal, 14)
                                            .padding(.vertical, 7)
                                            .background(Color.red.opacity(0.7))
                                            .foregroundColor(.white)
                                            .cornerRadius(14)
                                            .shadow(color: Color.black.opacity(0.10), radius: 2, x: 0, y: 1)
                                    }
                                }
                                .padding(.vertical, 2)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 24)
            }
        }
        .navigationTitle(recipe.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    DiningSpecificView(recipe: cannabisRecipes.first!)
}
