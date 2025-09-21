//
//  LearnSpecificView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 09.09.2025.
//

import SwiftUI

struct LearnSpecificView: View {
    var topic: String
    
    private var content: [(title: String, description: String)] {
        switch topic {
        case "Learn about hash":
            return [
                ("What is Hash?", "Hashish, commonly known as hash, is a concentrated form of cannabis made by collecting and compressing the trichomes, or resin glands, of the cannabis plant."),
                ("Methods of Production", "There are various methods to produce hash, including dry sift, bubble hash, and rosin."),
                ("Dry Sift", "Dry sift involves mechanically separating the trichomes using screens."),
                ("Bubble Hash", "Bubble hash uses ice water to separate the resin glands."),
                ("Rosin", "Rosin is made by applying heat and pressure to cannabis flowers or hash to extract the resin without solvents."),
                ("Varieties and Effects", "Each method results in different textures, potencies, and flavors, offering a diverse range of experiences for users.")
            ]
        case "Learn about weed":
            return [
                ("Introduction", "Cannabis, often referred to as weed, is cultivated through careful planting and nurturing."),
                ("Growing Process", "Growing cannabis involves selecting the right strains, preparing the soil or growing medium, and providing appropriate light, water, and nutrients."),
                ("Indoor Cultivation", "Indoor cultivation allows for controlled environments with artificial lighting and climate control."),
                ("Outdoor Cultivation", "Outdoor growing relies on natural sunlight and weather conditions."),
                ("Harvesting", "Harvesting is timed based on the maturity of the trichomes to maximize potency and flavor."),
                ("Post-Harvest", "After harvest, cannabis is dried and cured to enhance quality before distribution.")
            ]
        case "What's THC?":
            return [
                ("Definition", "THC, or tetrahydrocannabinol, is the primary psychoactive compound found in cannabis."),
                ("How It Works", "It interacts with the body's endocannabinoid system by binding to cannabinoid receptors in the brain."),
                ("Effects", "THC produces effects such as euphoria, altered perception, and relaxation."),
                ("Variability", "THC concentration varies among cannabis strains and products, influencing the intensity and duration of effects."),
                ("Importance", "Understanding THC is essential for responsible consumption and appreciating the diverse experiences cannabis offers.")
            ]
        case "Plant your own":
            return [
                ("Getting Started", "Growing your own cannabis plants can be a rewarding experience."),
                ("Choosing Seeds", "Start by choosing quality seeds or clones suited to your climate and preferences."),
                ("Growing Environment", "Provide a suitable growing environment with adequate light, temperature, and humidity."),
                ("Nutrients", "Use nutrient-rich soil or hydroponic systems to support healthy growth."),
                ("Plant Care", "Monitor your plants for pests and diseases, and prune them to encourage bushier growth."),
                ("Flowering and Harvest", "Flowering typically begins after a change in light cycle, and harvesting is done when trichomes reach desired maturity."),
                ("Drying and Curing", "Proper drying and curing will ensure the best taste and potency.")
            ]
        case "Bad Trips":
            return [
                ("Definition", "A 'bad trip' refers to challenging or unpleasant experiences during cannabis or other psychedelic use."),
                ("Symptoms", "These can include anxiety, paranoia, or confusion."),
                ("Causes", "Experiences are often influenced by dosage, individual sensitivity, and environment."),
                ("Prevention", "To minimize risk, start with a low dose, consume in a safe and comfortable setting, and have trusted people nearby."),
                ("Managing a Bad Trip", "If a bad trip occurs, staying calm, focusing on breathing, and reminding oneself that the effects are temporary can help."),
                ("Seeking Help", "Seeking professional support is important if distress persists.")
            ]
        case "Weed vs Alcohol":
            return [
                ("Overview", "Cannabis and alcohol are both widely used substances but differ significantly in their effects, risks, and cultural contexts."),
                ("Cannabis Effects", "Cannabis primarily affects the endocannabinoid system, producing psychoactive effects through compounds like THC."),
                ("Alcohol Effects", "Alcohol depresses the central nervous system."),
                ("Experiences", "Cannabis is often associated with relaxation and altered perception, whereas alcohol can impair motor skills and judgment."),
                ("Health Risks", "Health risks vary, with alcohol linked to liver damage and addiction, while cannabis risks include cognitive effects and dependency in some users."),
                ("Making Safer Choices", "Understanding these differences can inform safer consumption choices.")
            ]
        default:
            return [("Topic", "No content available.")]
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(content.indices, id: \.self) { index in
                    Text(content[index].title)
                        .font(.title2)
                        .bold()
                    Text(content[index].description)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
        }
        .navigationTitle(topic)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LearnSpecificView(topic: "Learn about hash")
}
