//
//  ActivityDetailView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 06.09.2025.
//

import SwiftUI

struct ActivityDetailView: View {
    let activity: Activity
    
    @State private var isLiked: Bool = false
    @State private var isFavorite: Bool = false
    @State private var likeCount: Int = 0
    @State private var likeButtonPressed: Bool = false
    @State private var favoriteButtonPressed: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(activity.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text(activity.subtitle)
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack(spacing: 20) {
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            isLiked.toggle()
                            if isLiked {
                                likeCount += 1
                            } else {
                                likeCount = max(likeCount - 1, 0)
                            }
                            likeButtonPressed = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            likeButtonPressed = false
                        }
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                            Text("\(likeCount)")
                        }
                        .font(.headline)
                        .foregroundColor(isLiked ? .green : .primary)
                        .scaleEffect(likeButtonPressed ? 1.2 : 1.0)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            isFavorite.toggle()
                            favoriteButtonPressed = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            favoriteButtonPressed = false
                        }
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .green : .black)
                            .font(.headline)
                            .scaleEffect(favoriteButtonPressed ? 1.2 : 1.0)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(activity.tags, id: \.self) { tag in

                        Text(tag)
                            .font(.caption)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.green.opacity(0.2))
                            .foregroundColor(Color.green.darken(amount: 0.3))
                            .cornerRadius(12)
                    }
                }
            }
            
            List {
                ForEach(activity.details, id: \.self) { detail in
                    Text(detail)
                        .foregroundColor(.primary)
                        .padding()
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(InsetListStyle())
            .frame(maxHeight: .infinity)
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationTitle("Activity Details")
        .onAppear {
            isLiked = false
            isFavorite = activity.isFavorite
            likeCount = activity.likes
        }
    }
}



private extension Color {
    func darken(amount: Double) -> Color {
        let uiColor = UIColor(self)
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return Color(hue: Double(hue), saturation: Double(saturation), brightness: Double(max(brightness - CGFloat(amount), 0)), opacity: Double(alpha))
    }
}
