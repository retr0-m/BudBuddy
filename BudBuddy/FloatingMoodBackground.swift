//
//  FloatingMoodBackground.swift
//  BudBuddy
//
//  Created by Matteo Cola on 07.09.2025.
//

import SwiftUI

struct FloatingMoodBackground: View {
    var weedType: WeedType? = nil
    var mood: String? = nil
    let particleCount = 20

    struct Particle: Identifiable {
        let id = UUID()
        let x: CGFloat
        let y: CGFloat
        let size: CGFloat
        let speed: Double
        let color: Color
        let shape: ShapeType
        enum ShapeType { case leaf, circle, capsule, star }
    }

    func generateParticles(width: CGFloat, height: CGFloat) -> [Particle] {
        (0..<particleCount).map { _ in
            let shape: Particle.ShapeType
            let color: Color
            var minSpeed: Double = 8

            switch (weedType, mood) {
            case (.indica?, _), (_, "Chill"):
                shape = .leaf
                color = Color.green.opacity(Double.random(in: 0.1...0.25))
            case (.sativa?, _), (_, "Fun"):
                shape = .circle
                color = [Color.yellow, Color.orange].randomElement()!.opacity(0.5)
                minSpeed = 2
            case (.hybrid?, _), (_, "Creative"):
                shape = .capsule
                color = [Color.purple.opacity(0.4), Color.green.opacity(0.4)].randomElement()!
            case (_, "Energetic"):
                shape = .star
                color = [Color.red.opacity(0.5), Color.orange.opacity(0.5)].randomElement()!
            case (_, "crazy"):
                shape = .star
                minSpeed = 2
                color = [
                    Color.red.opacity(0.5),
                    Color.orange.opacity(0.5),
                    Color.yellow.opacity(0.5),
                    Color.green.opacity(0.5),
                    Color.blue.opacity(0.5),
                    Color.purple.opacity(0.5),
                    Color.pink.opacity(0.5)
                    
                ].randomElement()!
            default:
                shape = .circle
                color = Color.gray.opacity(0.3)
            }

            return Particle(
                x: CGFloat.random(in: 0...width),
                y: CGFloat.random(in: 0...height),
                size: CGFloat.random(in: 5...30),
                speed: Double.random(in: 2...minSpeed),
                color: color,
                shape: shape
            )
        }
    }

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let particles = generateParticles(width: width, height: height)

            TimelineView(.animation) { timeline in
                let t = timeline.date.timeIntervalSinceReferenceDate
                ZStack {
                    ForEach(particles) { particle in
                        particleView(for: particle, t: t)
                            .position(
                                x: particle.x + CGFloat(sin(t / particle.speed) * 50),
                                y: particle.y + CGFloat(cos(t / particle.speed) * 50)
                            )
                    }
                }
            }
        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    private func particleView(for particle: Particle, t: TimeInterval) -> some View {
        switch particle.shape {
        case .leaf:
            Image(systemName: "leaf.fill")
                .resizable()
                .frame(width: particle.size, height: particle.size)
                .foregroundColor(particle.color)
                .rotationEffect(.degrees(Double(t * 30).truncatingRemainder(dividingBy: 360)))
        case .circle:
            Circle()
                .fill(particle.color)
                .frame(width: particle.size, height: particle.size)
        case .capsule:
            Capsule()
                .fill(particle.color)
                .frame(width: particle.size, height: particle.size / 2)
        case .star:
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: particle.size, height: particle.size)
                .foregroundColor(particle.color)
        }
    }
}
