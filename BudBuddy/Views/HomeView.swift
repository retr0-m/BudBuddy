//
//  HomeView.swift
//  BudBuddy
//
//  Created by Matteo Cola on 06.09.2025.
//

import SwiftUI



struct HomeView: View {
    @Binding var selectedTab: Int
    // MARK: - Tag Color for Flavor
    private func tagColor(for flavor: String) -> Color {
        switch flavor.lowercased() {
        case "sweet":
            return Color.pink
        case "earthy":
            return Color.brown
        case "citrus":
            return Color.orange
        case "spicy":
            return Color.red
        case "herbal":
            return Color.green
        case "pine":
            return Color.teal
        case "berry":
            return Color.purple
        case "floral":
            return Color.mint
        case "cheese":
            return Color.yellow
        default:
            return Color.gray
        }
    }
    let tabCount: Int
    
    @ObservedObject var authVM: AuthViewModel
    @State private var currentWeedType: WeedType = .indica
    @State private var recentSuggestions: [String] = []
    @State private var suggestionCardBackground: Color = Color.green.opacity(0.1)
    @State private var currentPairing: Pairing? = pairingsList.randomElement()
    @State private var selectedFlavor: String = pairingsList.first?.flavor ?? ""
    @State private var animateDrinkIcon = false
    @State private var animateFoodIcon = false
    
    
    var funFact: String {
        funFacts.randomElement() ?? ""
    }
    
    private func colorForWeedType(_ type: WeedType) -> Color {
        switch type {
        case .indica:
            return Color.green.opacity(0.1)
        case .sativa:
            return Color.orange.opacity(0.1)
        case .hybrid:
            return Color.purple.opacity(0.1)
        }
    }
    
    private func pastelColor(for type: WeedType) -> Color {
        switch type {
        case .indica:
            return Color(red: 0.8, green: 1.0, blue: 0.8) // pastel green
        case .sativa:
            return Color(red: 1.0, green: 0.85, blue: 0.7) // pastel orange
        case .hybrid:
            return Color(red: 0.9, green: 0.8, blue: 1.0) // pastel purple
        }
    }
    
    private func darkerColor(for type: WeedType) -> Color {
        switch type {
        case .indica:
            return Color(red: 0.2, green: 0.6, blue: 0.2) // darker green
        case .sativa:
            return Color(red: 0.8, green: 0.5, blue: 0.2) // darker orange
        case .hybrid:
            return Color(red: 0.5, green: 0.3, blue: 0.7) // darker purple
        }
    }
    
    @State private var currentQuestionIndex: Int = 0
    
    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    ReactiveBackgroundView(weedType: currentWeedType, mood: nil)
                    if currentWeedType != nil {
                        FloatingMoodBackground(weedType: currentWeedType, mood: nil)
                    }
                }
                // Place the profile button using a safeAreaInset at the top
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading) {
                        // Add top spacer to leave space for profile button
                        Spacer().frame(height: 5)
                        Text("Find something do to")
                            .font(.largeTitle)
                            .bold()
                            .padding(.top)
                        Text("I mean... to do")
                            .font(.subheadline)
                        
                        Picker("Weed Type", selection: $currentWeedType) {
                            ForEach(WeedType.allCases) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.vertical)
                        .onChange(of: currentWeedType) { newType in
                            suggestionCardBackground = colorForWeedType(newType)
                        }
                        
                        SuggestionCardView(weedType: currentWeedType, recentSuggestions: $recentSuggestions, backgroundColor: suggestionCardBackground)
                            .padding(.bottom)
                        // Quick Action Buttons
                        HStack(spacing: 30) {
                            Button(action: {
                                selectedTab = 1 // Activities tab
                            }) {
                                VStack {
                                    Image(systemName: "gamecontroller.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.green)
                                    Text("Activities")
                                        .foregroundColor(.primary)
                                        .font(.footnote)
                                }
                                .padding()
                                .background(Color.green.opacity(0.15))
                                .clipShape(Circle())
                            }
                            
                            Button(action: {
                                selectedTab = 2 // Strains tab
                            }) {
                                VStack {
                                    Image(systemName: "leaf.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.green)
                                    Text("Strains")
                                        .foregroundColor(.primary)
                                        .font(.footnote)
                                }
                                .padding()
                                .background(Color.green.opacity(0.15))
                                .clipShape(Circle())
                            }
                            
                            Button(action: {
                                selectedTab = 3 // Extras tab
                            }) {
                                VStack {
                                    Image(systemName: "sparkles")
                                        .font(.largeTitle)
                                        .foregroundColor(.green)
                                    Text("Extras")
                                        .foregroundColor(.primary)
                                        .font(.footnote)
                                }
                                .padding()
                                .background(Color.green.opacity(0.15))
                                .clipShape(Circle())
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom)
                        
                        // Recent Suggestions List
                        Text("Recent Suggestions")
                            .font(.headline)
                            .padding(.bottom, 2)
                        
                        ScrollView {
                            VStack(alignment: .leading, spacing: 8) {
                                if recentSuggestions.isEmpty {
                                    Text("No recent suggestions yet.")
                                        .foregroundColor(.secondary)
                                        .italic()
                                } else {
                                    ForEach(recentSuggestions.prefix(5), id: \.self) { suggestion in
                                        Text("• \(suggestion)")
                                            .font(.subheadline)
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                        }
                        .frame(maxHeight: 120)
                        .padding(.bottom)
                        
                        // Weed Fact section
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Weed Fact")
                                .font(.headline)
                            Text(weedFacts.randomElement() ?? "")
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        .frame(width: 320, alignment: .leading)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        
                        // Existential Questions Showcase - with title and refresh inside the card
                        ExistentialQuestionCard(
                            question: existentialQuestions[currentQuestionIndex],
                            weedType: currentWeedType,
                            pastelColor: pastelColor(for: currentWeedType),
                            darkerColor: darkerColor(for: currentWeedType),
                            refreshAction: {
                                withAnimation {
                                    var newIndex: Int
                                    repeat {
                                        newIndex = Int.random(in: 0..<existentialQuestions.count)
                                    } while existentialQuestions.count > 1 && newIndex == currentQuestionIndex
                                    currentQuestionIndex = newIndex
                                }
                            }
                        )
                        .frame(maxWidth: .infinity, minHeight: 220)
                        .padding(.vertical)
                        .padding(.horizontal)
                        // No Spacer() at the bottom since ScrollView handles scrolling
                        // Daily tip/fun fact section
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Fun fact")
                                .font(.headline)
                            Text(funFact)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        .frame(width: 320, alignment: .leading)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        
                        MovieSuggestionBox()
                        // Mood-Based Activity Section
                        MoodBasedActivityBox()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("**Flavor Pairing**")
                                .font(.title3)
                            Text("Check flavors of your strain in Strains pages")
                                .font(.subheadline)
                            Picker("Flavor", selection: $selectedFlavor) {
                                ForEach(Array(Set(pairingsList.map { $0.flavor })).sorted(), id: \.self) { flavor in
                                    Text(flavor)
                                        .padding(6)
                                        .background(tagColor(for: flavor).opacity(0.2))
                                        .cornerRadius(8)
                                        .tag(flavor)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .onChange(of: selectedFlavor) { newFlavor in
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.5)) {
                                    animateDrinkIcon.toggle()
                                    animateFoodIcon.toggle()
                                }
                                if let newPairing = pairingsList.first(where: { $0.flavor == newFlavor }) {
                                    currentPairing = newPairing
                                }
                            }
                            if let pairing = currentPairing {
                                HStack(alignment: .center) {
                                    VStack {
                                        Image(systemName: "wineglass")
                                            .font(.largeTitle)
                                            .foregroundStyle(Color.purple)
                                            .rotationEffect(.degrees(animateDrinkIcon ? 360 : 0))
                                            .animation(.spring(response: 0.6, dampingFraction: 0.5), value: animateDrinkIcon)
                                        Text(pairing.suggestedDrink)
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 100, height: 170)
                                    .frame(maxHeight: .infinity, alignment: .center)
                                    .padding()
                                    .background(tagColor(for: selectedFlavor).opacity(0.3))
                                    .cornerRadius(20)
                                    VStack {
                                        Image(systemName: "fork.knife")
                                            .font(.largeTitle)
                                            .foregroundStyle(Color.yellow)
                                            .rotationEffect(.degrees(animateFoodIcon ? 360 : 0))
                                            .animation(.spring(response: 0.6, dampingFraction: 0.5), value: animateFoodIcon)
                                        Text(pairing.suggestedFood)
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 100, height: 170)
                                    .frame(maxHeight: .infinity, alignment: .center)
                                    .padding()
                                    .background(tagColor(for: selectedFlavor).opacity(0.3))
                                    .cornerRadius(20)
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                            }
                            Button("Random") {
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.5)) {
                                    animateDrinkIcon.toggle()
                                    animateFoodIcon.toggle()
                                }
                                withAnimation {
                                    currentPairing = pairingsList.randomElement()
                                    selectedFlavor = currentPairing?.flavor ?? ""
                                }
                            }
                            .font(.caption)
                            .padding(.top, 4)
                        }
                        .frame(width: 320, alignment: .leading)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        // 420 Countdown Timer Section
                        FourTwentyCountdownBox()
                    }
                    .padding(.horizontal)
                    Image("HighDudePopUp")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .navigationBarHidden(true)
                // Overlay the profilebutton at the top-right using safeAreaInset
                .safeAreaInset(edge: .top, alignment: .trailing, spacing: 0) {
                    HStack(spacing: 12) {
                        NotificationsButton(authVM: authVM, )
                            .padding(.leading, 16)
                            .padding(.top, 4)
                        Spacer()
                        // Profile and friends buttons
                        SocialButtons(authVM: authVM)
                            .padding(.trailing, 16)
                            .padding(.top, 4)
                        
                    }
                }
            }
        }
    }
    

 


    struct ExistentialQuestionCard: View {
        let question: String
        let weedType: WeedType
        let pastelColor: Color
        let darkerColor: Color
        let refreshAction: () -> Void
        
        @State private var appeared = false
        @State private var refreshPressed = false
        @State private var starTwinkleSeed: Double = Double.random(in: 0...1000)
        
        var body: some View {
            ZStack {
                // Space-themed animated background
                SpaceBackgroundView(twinkleSeed: starTwinkleSeed)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .allowsHitTesting(false)
                
                VStack(spacing: 18) {
                    Text("Just wondering...")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .italic()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(.top, 2)
                    Text(question)
                        .font(.title3)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.18)) {
                            refreshPressed = true
                            // Change twinkle pattern for fun
                            starTwinkleSeed = Double.random(in: 0...1000)
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.22) {
                            withAnimation(.spring(response: 0.25, dampingFraction: 0.65)) {
                                refreshPressed = false
                            }
                        }
                        refreshAction()
                    }) {
                        Text("Refresh")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 10)
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white, lineWidth: 1.5)
                            )
                    }
                    .scaleEffect(refreshPressed ? 0.93 : 1.0)
                    .animation(.spring(response: 0.25, dampingFraction: 0.65), value: refreshPressed)
                }
                .padding(.vertical, 22)
                .padding(.horizontal, 18)
            }
            .frame(maxWidth: .infinity, minHeight: 200, alignment: .center)
            .background(Color.clear)
            .cornerRadius(15)
            .shadow(color: darkerColor.opacity(0.3), radius: 5, x: 0, y: 3)
            .opacity(appeared ? 1 : 0)
            .scaleEffect(appeared ? 1 : 0.96)
            .animation(.easeOut(duration: 0.7), value: appeared)
            .onAppear {
                appeared = true
            }
        }
    }
    
    // MARK: - Space Themed Animated Background
    struct SpaceBackgroundView: View {
        let twinkleSeed: Double
        let starCount: Int = 38
        
        struct Star: Identifiable {
            let id = UUID()
            let x: CGFloat
            let y: CGFloat
            let size: CGFloat
            let baseOpacity: Double
            let speed: Double
            let phase: Double
        }
        
        func generateStars(seed: Double, width: CGFloat, height: CGFloat) -> [Star] {
            var stars: [Star] = []
            var rng = SeededRandomNumberGenerator(seed: UInt64(seed * 10000))
            for _ in 0..<starCount {
                let x = CGFloat.random(in: 0...1, using: &rng) * width
                let y = CGFloat.random(in: 0...1, using: &rng) * height
                let size = CGFloat.random(in: 1.5...3.7, using: &rng)
                let baseOpacity = Double.random(in: 0.55...1.0, using: &rng)
                let speed = Double.random(in: 2.5...6.5, using: &rng)
                let phase = Double.random(in: 0...2 * .pi, using: &rng)
                stars.append(Star(x: x, y: y, size: size, baseOpacity: baseOpacity, speed: speed, phase: phase))
            }
            return stars
        }
        
        var body: some View {
            GeometryReader { geo in
                let width = geo.size.width
                let height = geo.size.height
                let stars = generateStars(seed: twinkleSeed, width: width, height: height)
                TimelineView(.animation) { timeline in
                    let t = timeline.date.timeIntervalSinceReferenceDate
                    ZStack {
                        // Radial gradient background: black to deep blue
                        RadialGradient(gradient: Gradient(colors: [Color.black, Color(red: 0.07, green: 0.11, blue: 0.25)]), center: .center, startRadius: 20, endRadius: max(width, height) * 0.8)
                            .ignoresSafeArea()
                        // Stars
                        ForEach(stars) { star in
                            // Twinkle by modulating opacity and a subtle scale
                            let twinkle = 0.5 + 0.5 * sin((t / star.speed) + star.phase)
                            let opacity = star.baseOpacity * (0.7 + 0.3 * twinkle)
                            let scale = 0.85 + 0.18 * twinkle
                            Circle()
                                .fill(Color.white)
                                .frame(width: star.size, height: star.size)
                                .position(x: star.x, y: star.y)
                                .opacity(opacity)
                                .scaleEffect(scale)
                        }
                    }
                }
            }
        }
    }
}
    
    // MARK: - Deterministic Random Number Generator for Stars
    
    struct SeededRandomNumberGenerator: RandomNumberGenerator {
        private var state: UInt64
        init(seed: UInt64) { self.state = seed }
        mutating func next() -> UInt64 {
            // Xorshift64*
            var x = state
            x ^= x >> 12
            x ^= x << 25
            x ^= x >> 27
            state = x
            return x &* 2685821657736338717
        }
    }
    
    // MARK: - Animated Floating Leaves Background
    struct FloatingLeavesBackground: View {
        // Number of leaves
        let leafCount = 15
        // Random properties for each leaf
        struct Leaf: Identifiable {
            let id = UUID()
            let size: CGFloat
            let xStart: CGFloat
            let yStart: CGFloat
            let xRange: CGFloat
            let yRange: CGFloat
            let speed: Double
            let vertical: Bool
            let opacity: Double
            let delay: Double
        }
        let leaves: [Leaf] = {
            (0..<15).map { _ in
                let size = CGFloat.random(in: 20...50)
                let xStart = CGFloat.random(in: 0.0...1.0)
                let yStart = CGFloat.random(in: 0.0...1.0)
                let vertical = Bool.random()
                let xRange = vertical ? CGFloat.random(in: -0.1...0.1) : CGFloat.random(in: -0.4...0.4)
                let yRange = vertical ? CGFloat.random(in: 0.3...0.8) : CGFloat.random(in: -0.1...0.1)
                let speed = Double.random(in: 18.0...36.0)
                let opacity = Double.random(in: 0.06...0.13)
                let delay = Double.random(in: 0.0...speed)
                return Leaf(size: size, xStart: xStart, yStart: yStart, xRange: xRange, yRange: yRange, speed: speed, vertical: vertical, opacity: opacity, delay: delay)
            }
        }()
        
        var body: some View {
            GeometryReader { geo in
                TimelineView(.animation) { timeline in
                    let now = timeline.date.timeIntervalSinceReferenceDate
                    ZStack {
                        ForEach(leaves) { leaf in
                            let t = ((now + leaf.delay).truncatingRemainder(dividingBy: leaf.speed)) / leaf.speed
                            // Animate position along a path (vertical or horizontal drift)
                            let x = leaf.xStart * geo.size.width + leaf.xRange * geo.size.width * CGFloat(sin(t * 2 * .pi))
                            let y = leaf.yStart * geo.size.height + leaf.yRange * geo.size.height * CGFloat(cos(t * 2 * .pi))
                            Image(systemName: "leaf.fill")
                                .font(.system(size: leaf.size))
                                .foregroundColor(Color.green.opacity(leaf.opacity))
                                .position(x: x, y: y)
                                .rotationEffect(.degrees(Double(t) * 360))
                                .blur(radius: 0.5)
                        }
                    }
                }
            }
        }
    }
    
    struct SuggestionCardView: View {
        let weedType: WeedType
        @Binding var recentSuggestions: [String]
        let backgroundColor: Color
        @State private var suggestion: String = "Tap HIT ME to get an idea 🍃"
        @State private var bounce: Bool = false
        
        private func pastelColor(for type: WeedType) -> Color {
            switch type {
            case .indica:
                return Color(red: 0.8, green: 1.0, blue: 0.8) // pastel green
            case .sativa:
                return Color(red: 1.0, green: 0.85, blue: 0.7) // pastel orange
            case .hybrid:
                return Color(red: 0.9, green: 0.8, blue: 1.0) // pastel purple
            }
        }
        
        private func darkerColor(for type: WeedType) -> Color {
            switch type {
            case .indica:
                return Color(red: 0.2, green: 0.6, blue: 0.2) // darker green
            case .sativa:
                return Color(red: 0.8, green: 0.5, blue: 0.2) // darker orange
            case .hybrid:
                return Color(red: 0.5, green: 0.3, blue: 0.7) // darker purple
            }
        }
        
        var body: some View {
            let cardColor = pastelColor(for: weedType)
            let buttonColor = darkerColor(for: weedType)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Your Activity")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(suggestion)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                
                Button(action: {
                    // Pick a random suggestion based on the weed type
                    let filtered = allSuggestions.filter { $0.type == weedType }
                    if let newSuggestion = filtered.randomElement()?.text {
                        suggestion = newSuggestion
                        // Add to recent suggestions, keep last 5
                        recentSuggestions.insert(newSuggestion, at: 0)
                        if recentSuggestions.count > 5 {
                            recentSuggestions = Array(recentSuggestions.prefix(5))
                        }
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0)) {
                            bounce = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            bounce = false
                        }
                    }
                }) {
                    Text("HIT ME")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(buttonColor) // darker color for button
                        .cornerRadius(12)
                }
            }
            .padding()
            .background(cardColor) // solid pastel card background
            .cornerRadius(15)
            .scaleEffect(bounce ? 1.05 : 1.0)
        }
    }


// MARK: - Mood-Based Activity Section
struct MoodBasedActivityBox: View {
    @State private var energy: Double = 5
    @State private var creativity: Double = 5
    @State private var animateSuggestion: Bool = false

    private var suggestedActivity: String {
        // Weight-based selection for more nuance
        let energyWeight = energy / 10.0
        let creativityWeight = creativity / 10.0

        var selectedTags: [String] = []
        if energyWeight > 0.6 { selectedTags.append(contentsOf: ["Active", "Outdoor"]) }
        if creativityWeight > 0.6 { selectedTags.append(contentsOf: ["Creative", "Art"]) }

        // If no tags meet the threshold, use all activities
        if selectedTags.isEmpty {
            selectedTags = []
        }
        // Gather all activities from the arrays
        let allActivities: [Activity] =
            (mostQuotedActivities as [Activity]) +
            (lastCreatedActivities as [Activity]) +
            (favoriteActivities as [Activity]) +
            (createdActivities as [Activity])
        // Filter by tags if any selected, otherwise use all
        let filtered: [Activity]
        if selectedTags.isEmpty {
            filtered = allActivities
        } else {
            filtered = allActivities.filter { activity in
                activity.tags.contains(where: { selectedTags.contains($0) })
            }
        }
        if let randomActivity = filtered.randomElement() {
            return randomActivity.title
        } else {
            return "Mix it up! Explore a new hobby or activity."
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("**Mood-Based Activity**")
                .font(.title3)
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Energy")
                        .font(.subheadline)
                    Spacer()
                    Text("\(Int(energy))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Slider(value: $energy, in: 1...10, step: 1) { _ in
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                        animateSuggestion.toggle()
                    }
                }
                HStack {
                    Text("Creativity")
                        .font(.subheadline)
                    Spacer()
                    Text("\(Int(creativity))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Slider(value: $creativity, in: 1...10, step: 1) { _ in
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                        animateSuggestion.toggle()
                    }
                }
            }
            .padding(.bottom, 8)
            HStack {
                Image(systemName: "lightbulb.min")
                    .foregroundColor(.yellow)
                Text(suggestedActivity)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            .cornerRadius(10)
            .shadow(color: Color.blue.opacity(0.07), radius: 3, x: 0, y: 2)
            .scaleEffect(animateSuggestion ? 1.04 : 1.0)
            .animation(.spring(response: 0.5, dampingFraction: 0.7), value: animateSuggestion)
        }
        .frame(width: 320, alignment: .leading)
        .padding()
        .background(Color.primary.opacity(0.1))
        .cornerRadius(12)
        .shadow(color: Color.blue.opacity(0.11), radius: 6, x: 0, y: 3)
        .padding(.vertical, 4)
    }
}



// MARK: - Random movie suggestion
struct MovieSuggestionBox: View {
    @State private var currentMovie: MovieSuggestion? = nil
    @State private var selectedGenre: String = ""

    // Helper: assign a color to each genre
    private func genreColor(for genre: String) -> Color {
        switch genre.lowercased() {
        case "comedy": return .yellow
        case "trippy": return .purple
        case "sci-fi": return .blue
        case "animated": return .orange
        case "drama": return .red
        case "documentary": return .green
        default: return .gray
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Netflix and chill?")
                    .font(.title3.bold())
                Spacer()
                Image(systemName: "sofa.fill")
                    .font(.title)
            }

            // Genre picker tags
            let genres = Array(Set(movieSuggestions.map { $0.genre })).sorted()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(genres, id: \.self) { genre in
                        Button(action: {
                            if selectedGenre == genre {
                                // Deselect if tapped again
                                selectedGenre = ""
                                currentMovie = movieSuggestions.randomElement()
                            } else {
                                selectedGenre = genre
                                let moviesOfGenre = movieSuggestions.filter { $0.genre == genre }
                                currentMovie = moviesOfGenre.randomElement()
                            }
                        }) {
                            Text(genre)
                                .font(.caption)
                                .foregroundColor(selectedGenre == genre ? .primary : .secondary)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 7)
                                .background(
                                    genreColor(for: genre).opacity(selectedGenre == genre ? 0.35 : 0.2)
                                )
                                .cornerRadius(8)
                                .padding(.horizontal, 4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(selectedGenre == genre ? genreColor(for: genre) : Color.clear, lineWidth: 1.5)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.vertical, 2)
            }

            HStack{
                if let movie = currentMovie {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(movie.title)
                            .font(.headline)
                        Text(movie.genre)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
                Button(action: {
                    if selectedGenre.isEmpty {
                        currentMovie = movieSuggestions.randomElement()
                    } else {
                        let moviesOfGenre = movieSuggestions.filter { $0.genre == selectedGenre }
                        currentMovie = moviesOfGenre.randomElement()
                    }
                }) {
                    Text("Refresh")
                        .font(.subheadline)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(8)
                        .foregroundColor(.primary)
                }
            }

        }
        .frame(width: 320, alignment: .leading)
        .padding()
        .background(Color.primary.opacity(0.1))
        .cornerRadius(12)
        .shadow(color: Color.blue.opacity(0.11), radius: 6, x: 0, y: 3)
        .padding(.vertical, 4)
        .onAppear {
            currentMovie = movieSuggestions.randomElement()
        }
    }
}

// MARK: - 4:20 Countdown Timer View
struct FourTwentyCountdownBox: View {
    @State private var timeRemaining: String = "--:--:--"
    @State private var timer: Timer? = nil

    private func nextFourTwentyDate(from now: Date = Date()) -> Date {
        let calendar = Calendar.current
        let nowComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
        var next = now
        // Build today's 4:20 AM and 4:20 PM
        var fourTwentyAM = DateComponents()
        fourTwentyAM.year = nowComponents.year
        fourTwentyAM.month = nowComponents.month
        fourTwentyAM.day = nowComponents.day
        fourTwentyAM.hour = 4
        fourTwentyAM.minute = 20
        fourTwentyAM.second = 0
        var fourTwentyPM = fourTwentyAM
        fourTwentyPM.hour = 16
        // Get Date objects
        let todayAM = calendar.date(from: fourTwentyAM)!
        let todayPM = calendar.date(from: fourTwentyPM)!
        if now < todayAM {
            // Next 4:20 is today at 4:20 AM
            return todayAM
        } else if now < todayPM {
            // Next 4:20 is today at 4:20 PM
            return todayPM
        } else {
            // Next 4:20 is tomorrow at 4:20 AM
            var tomorrow = now.addingTimeInterval(60*60*24)
            let tomorrowComponents = calendar.dateComponents([.year, .month, .day], from: tomorrow)
            var nextAM = fourTwentyAM
            nextAM.year = tomorrowComponents.year
            nextAM.month = tomorrowComponents.month
            nextAM.day = tomorrowComponents.day
            return calendar.date(from: nextAM)!
        }
    }

    private func updateTimeRemaining() {
        let now = Date()
        let target = nextFourTwentyDate(from: now)
        let interval = Int(target.timeIntervalSince(now))
        if interval < 0 {
            timeRemaining = "--:--:--"
            return
        }
        let hours = interval / 3600
        let minutes = (interval % 3600) / 60
        let seconds = interval % 60
        timeRemaining = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    var body: some View {
        VStack(spacing: 8) {
            Text("Next 4:20")
                .font(.headline)
            Text(timeRemaining)
                .font(.system(size: 45, weight: .bold, design: .rounded))
                .monospacedDigit()
                .frame(maxWidth: .infinity)
                .padding(.bottom, 2)
        }
        .frame(width: 320, alignment: .center)
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
        .onAppear {
            updateTimeRemaining()
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                updateTimeRemaining()
            }
        }
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
    }
}
