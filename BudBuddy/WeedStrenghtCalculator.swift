//
//  WeedStrenghtCalculator.swift
//  BudBuddy
//
//  Created by Matteo Cola on 08.09.2025.
//

import SwiftUI

struct WeedStrenghtCalculator: View {
    @State var HideComsumptionMethod: Bool = false
    enum ConsumptionMethod: String, CaseIterable, Identifiable {
        case smokeVape = "Smoke/Vape"
        case edible = "Edible"
        var id: String { self.rawValue }
    }
    
    enum ProductType: String, CaseIterable, Identifiable {
        case weed = "Weed"
        case hash = "Hash"
        var id: String { self.rawValue }
    }
    
    enum HashType: String, CaseIterable, Identifiable {
        case drySift = "Dry Sift"
        case frozen = "Frozen"
        case iceOLator = "Ice-O-Lator"
        case resin = "Resin"
        case rosin = "Rosin"
        case liveRosin = "Live Rosin"
        case liveResin = "Live Resin"
        var id: String { self.rawValue }
        
        var thcPercentage: Double {
            switch self {
            case .drySift: return 20
            case .frozen: return 25
            case .iceOLator: return 30
            case .resin: return 35
            case .rosin: return 50
            case .liveRosin: return 55
            case .liveResin: return 60
            }
        }
    }
    
    @State private var consumptionMethod: ConsumptionMethod = .smokeVape
    @State private var productType: ProductType = .weed
    @State private var thcWeed: Double = 15
    @State private var selectedHashType: HashType = .drySift
    @State private var tolerance: Double = 5
    @State private var desiredHigh: Double = 5
    @State private var recommendedDosage: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    if !HideComsumptionMethod {
                        Picker("Consumption Method", selection: $consumptionMethod) {
                            ForEach(ConsumptionMethod.allCases) { method in
                                Text(method.rawValue).tag(method)
                            }
                        }
                        .pickerStyle(.segmented)
                        .animation(.easeInOut, value: consumptionMethod)
                    } else {
                        EmptyView()
                            .onAppear { consumptionMethod = .edible }
                    }
                    
                    Picker("Product Type", selection: $productType) {
                        ForEach(ProductType.allCases) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .pickerStyle(.segmented)
                    .animation(.easeInOut, value: productType)
                    
                    if productType == .weed {
                        VStack(alignment: .leading) {
                            Text("THC Percentage: \(Int(thcWeed))%")
                                .bold()
                            Slider(value: $thcWeed, in: 5...35, step: 1)
                                .accentColor(.green)
                                .animation(.easeInOut, value: thcWeed)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                    } else {
                        VStack(alignment: .leading) {
                            Text("Hash Type")
                                .bold()
                            Picker("Hash Type", selection: $selectedHashType) {
                                ForEach(HashType.allCases) { hash in
                                    Text("\(hash.rawValue) (\(Int(hash.thcPercentage))%)").tag(hash)
                                }
                            }
                            .pickerStyle(.menu)
                            .animation(.easeInOut, value: selectedHashType)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                    }
                    
                    VStack(spacing: 12) {
                        VStack(alignment: .leading) {
                            Text("Tolerance: \(Int(tolerance))")
                            Slider(value: $tolerance, in: 1...10, step: 1)
                                .accentColor(.green)
                                .animation(.easeInOut, value: tolerance)
                        }
                        VStack(alignment: .leading) {
                            Text("Desired High: \(Int(desiredHigh))")
                            Slider(value: $desiredHigh, in: 1...10, step: 1)
                                .accentColor(.green)
                                .animation(.easeInOut, value: desiredHigh)
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.05))
                    .cornerRadius(12)
                    
                    Button(action: calculateDosage) {
                        Text("Calculate")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    if !recommendedDosage.isEmpty {
                        Text("Recommended dosage: \(recommendedDosage) grams")
                            .bold()
                            .foregroundColor(.green)
                            .transition(.opacity)
                            .animation(.easeInOut, value: recommendedDosage)
                    }
                }
                .padding()
            }
            .navigationTitle("Dosage Calculator")
            .accentColor(.blue)
        }
    }
    
    private func calculateDosage() {
        let thc: Double
        switch productType {
        case .weed:
            thc = thcWeed
        case .hash:
            thc = selectedHashType.thcPercentage
        }
        
        // Base dosage constant (grams)
        let baseDosage = 0.1
        
        // Adjust dosage by THC potency
        let potencyFactor = 20 / thc
        
        // Adjust for tolerance and desired high
        let toleranceFactor = tolerance / 5
        let desiredHighFactor = desiredHigh / 5
        
        // New: Adjust for consumption method
        let methodFactor: Double
        switch consumptionMethod {
        case .smokeVape:
            methodFactor = 1.5  // baseline
        case .edible:
            methodFactor = 1.35  // requires less material because effect lasts longer
        }
        
        let dosage = baseDosage * potencyFactor * toleranceFactor * desiredHighFactor * methodFactor
        
        withAnimation {
            recommendedDosage = String(format: "%.2f", max(dosage, 0.05))
        }
    }
}

#Preview {
    WeedStrenghtCalculator()
}
