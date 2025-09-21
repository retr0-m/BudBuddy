//
//  DiningView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 08.09.2025.
//

import SwiftUI



struct DiningView: View {
    @State private var searchText: String = ""
    var body: some View {
            ZStack {
                // Background
                MovingFlamesBackground()
                LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.65), Color.cyan.opacity(0.35)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                    .blendMode(.plusLighter)
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(cannabisRecipes.filter { searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText) }) { recipe in
                            NavigationLink(destination: DiningSpecificView(recipe: recipe)) {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(recipe.title)
                                        .font(.headline)
                                        .bold()
                                        .foregroundColor(.primary)
                                    HStack(spacing: 16) {
                                        HStack(spacing: 4) {
                                            Image(systemName: "clock")
                                                .foregroundColor(.red)
                                            Text("\(recipe.prepTime) + \(recipe.cookTime)")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                        }
                                        HStack(spacing: 4) {
                                            Image(systemName: "flame.fill")
                                                .foregroundColor(.red)
                                            Text(recipe.difficulty)
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(18)
                                .shadow(color: Color.black.opacity(0.10), radius: 6, x: 0, y: 4)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal)
                }
            }
            .searchable(text: $searchText, prompt: "Search recipes")
            .navigationTitle("Cannabis Recipes")
            .navigationBarTitleDisplayMode(.inline)
        
    }
    
}


struct MovingFlamesBackground: View {
    private struct Flame: Identifiable {
        let id = UUID()
        let basePosition: CGPoint
        let size: CGFloat
        let opacity: Double
        let color: Color
        let xAmplitude: CGFloat
        let yAmplitude: CGFloat
        let xFrequency: Double
        let yFrequency: Double
        let xPhase: Double
        let yPhase: Double
    }
    
    @State private var time: Double = 0
    
    private let flames: [Flame] = {
        var array: [Flame] = []
        let count = 10
        for _ in 0..<count {
            let baseX = CGFloat.random(in: 0...1)
            let baseY = CGFloat.random(in: 0...1)
            let size = CGFloat.random(in: 20...60)
            let opacity = Double.random(in: 0.1...0.3)
            let color = Bool.random() ? Color.orange : Color.red
            let xAmplitude = CGFloat.random(in: 5...20)
            let yAmplitude = CGFloat.random(in: 5...20)
            let xFrequency = Double.random(in: 0.5...1.5)
            let yFrequency = Double.random(in: 0.5...1.5)
            let xPhase = Double.random(in: 0...(2 * Double.pi))
            let yPhase = Double.random(in: 0...(2 * Double.pi))
            array.append(Flame(basePosition: CGPoint(x: baseX, y: baseY),
                               size: size,
                               opacity: opacity,
                               color: color,
                               xAmplitude: xAmplitude,
                               yAmplitude: yAmplitude,
                               xFrequency: xFrequency,
                               yFrequency: yFrequency,
                               xPhase: xPhase,
                               yPhase: yPhase))
        }
        return array
    }()
    
    var body: some View {
        TimelineView(.animation) { timeline in
            let time = timeline.date.timeIntervalSinceReferenceDate
            GeometryReader { geo in
                ZStack {
                    ForEach(flames) { flame in
                        let xOffset = flame.xAmplitude * CGFloat(sin(flame.xFrequency * time + flame.xPhase))
                        let yOffset = flame.yAmplitude * CGFloat(cos(flame.yFrequency * time + flame.yPhase))
                        Image(systemName: "flame.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: flame.size, height: flame.size)
                            .foregroundColor(flame.color)
                            .opacity(flame.opacity)
                            .position(x: geo.size.width * flame.basePosition.x + xOffset,
                                      y: geo.size.height * flame.basePosition.y + yOffset)
                    }
                }
                .clipped()
            }
        }
        .ignoresSafeArea()
    }
}


#Preview {
    DiningView()
}
