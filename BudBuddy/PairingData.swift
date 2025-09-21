//
//  PairingData.swift
//  BudBuddy
//
//  Created by Matteo Cola on 07.09.2025.
//


import Foundation

struct Pairing: Identifiable {
    let id = UUID()
    let flavor: String
    let suggestedDrink: String
    let suggestedFood: String
}

let pairingsList: [Pairing] = [
    Pairing(flavor: "Citrus", suggestedDrink: "Iced Green Tea", suggestedFood: "Lemon Cheesecake"),
    Pairing(flavor: "Earthy", suggestedDrink: "Espresso", suggestedFood: "Mushroom Risotto"),
    Pairing(flavor: "Sweet", suggestedDrink: "Vanilla Milkshake", suggestedFood: "Chocolate Brownie"),
    Pairing(flavor: "Pine", suggestedDrink: "Gin & Tonic", suggestedFood: "Rosemary Roast Potatoes"),
    Pairing(flavor: "Berry", suggestedDrink: "Berry Smoothie", suggestedFood: "Blueberry Muffin"),
    Pairing(flavor: "Tropical", suggestedDrink: "Pina Colada", suggestedFood: "Mango Sticky Rice"),
    Pairing(flavor: "Spicy", suggestedDrink: "Chai Latte", suggestedFood: "Cinnamon Rolls"),
    Pairing(flavor: "Herbal", suggestedDrink: "Mint Tea", suggestedFood: "Caprese Salad"),
    Pairing(flavor: "Diesel", suggestedDrink: "Cold Brew Coffee", suggestedFood: "BBQ Pulled Pork"),
    Pairing(flavor: "Nutty", suggestedDrink: "Hazelnut Latte", suggestedFood: "Peanut Butter Cookies")
]
