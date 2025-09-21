//
//  ReactiveBackgroundView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 07.09.2025.
//

import SwiftUI

struct ReactiveBackgroundView: View {
    let weedType: WeedType?
    let mood: String?

    var body: some View {
        Group {
            if weedType == nil && mood == nil {
                // Neutral light background when both are nil
                Color(.systemGray6)
                    .ignoresSafeArea()
            } else {
                ZStack {
                    if let weedType = weedType {
                        switch weedType {
                        case .indica:
                            LinearGradient(
                                gradient: Gradient(colors: [Color.accentColor.opacity(0.8), Color.white.opacity(0.2)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .ignoresSafeArea()
                        case .sativa:
                            LinearGradient(
                                gradient: Gradient(colors: [Color.orange.opacity(0.18), Color.yellow.opacity(0.26)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .ignoresSafeArea()
                        case .hybrid:
                            LinearGradient(
                                gradient: Gradient(colors: [Color.purple.opacity(0.14), Color.blue.opacity(0.27)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .ignoresSafeArea()
                        }
                    } else {
                        // If weedType is nil but mood is not, fallback to neutral
                        Color(.systemGray6)
                            .ignoresSafeArea()
                        
                        }
                    }
                }
            }
        }
    }

