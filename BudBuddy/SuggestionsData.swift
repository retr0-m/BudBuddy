//
//  SuggestionsData.swift
//  BudBuddy
//
//  Created by Matteo Cola on 06.09.2025.
//

import Foundation

enum WeedType: String, CaseIterable, Identifiable {
    case indica = "Indica"
    case hybrid = "Hybrid"
    case sativa = "Sativa"
    
    var id: String { self.rawValue }
}

struct WeedSuggestion {
    let text: String
    let type: WeedType
}

let allSuggestions: [WeedSuggestion] = [
    // Indica — mostly indoor, movies, shows, relaxing
    WeedSuggestion(text: "Watch The Big Lebowski 🎥", type: .indica),
    WeedSuggestion(text: "Binge-watch Planet Earth 🦁", type: .indica),
    WeedSuggestion(text: "Watch Spirited Away 🍃", type: .indica),
    WeedSuggestion(text: "Watch Bob Ross paint on YouTube 🎨", type: .indica),
    WeedSuggestion(text: "Watch Rick & Morty 🚀", type: .indica),
    WeedSuggestion(text: "Watch Adventure Time 🐶", type: .indica),
    WeedSuggestion(text: "Watch Cosmos with Neil deGrasse Tyson 🌌", type: .indica),
    WeedSuggestion(text: "Watch Studio Ghibli movies 🍄", type: .indica),
    WeedSuggestion(text: "Watch The Office (US) 😂", type: .indica),
    WeedSuggestion(text: "Watch Parks and Recreation 🌳", type: .indica),
    WeedSuggestion(text: "Watch The Simpsons classic episodes 🍩", type: .indica),
    WeedSuggestion(text: "Watch a relaxing aquarium video 🐠", type: .indica),
    WeedSuggestion(text: "Watch ASMR food videos 🥑", type: .indica),
    WeedSuggestion(text: "Watch How It's Made 🛠️", type: .indica),
    WeedSuggestion(text: "Watch a fireplace video 🔥", type: .indica),
    WeedSuggestion(text: "Watch cat compilation videos 🐱", type: .indica),
    WeedSuggestion(text: "Watch Happy Tree Friends (if you dare) 🌳", type: .indica),
    WeedSuggestion(text: "Watch Interstellar 🌠", type: .indica),
    WeedSuggestion(text: "Watch a Studio Ghibli marathon 🧚", type: .indica),
    WeedSuggestion(text: "Watch Lord of the Rings trilogy 🧙", type: .indica),
    WeedSuggestion(text: "Watch a stand-up comedy special 🎤", type: .indica),
    WeedSuggestion(text: "Watch nature sounds and rain videos 🌧️", type: .indica),
    WeedSuggestion(text: "Watch a food travel show 🌮", type: .indica),
    WeedSuggestion(text: "Watch a slow TV train ride 🚂", type: .indica),
    WeedSuggestion(text: "Watch a science documentary 🔬", type: .indica),
    WeedSuggestion(text: "Watch Midnight Gospel on Netflix 🌈", type: .indica),
    WeedSuggestion(text: "Watch Your Name (Kimi no Na wa) 🌠", type: .indica),
    WeedSuggestion(text: "Watch a Lo-fi hip hop stream 📻", type: .indica),
    WeedSuggestion(text: "Watch The Great British Bake Off 🍰", type: .indica),
    WeedSuggestion(text: "Watch a classic Disney movie 🏰", type: .indica),
    WeedSuggestion(text: "Watch The Matrix 🕶️", type: .indica),
    WeedSuggestion(text: "Watch a silent movie 🎬", type: .indica),
    WeedSuggestion(text: "Watch a time-lapse of clouds ☁️", type: .indica),
    WeedSuggestion(text: "Watch a TED talk that interests you 💡", type: .indica),
    WeedSuggestion(text: "Watch a relaxing cooking show 🍳", type: .indica),
    WeedSuggestion(text: "Watch a dog training video 🐕", type: .indica),
    // Sativa — games, energetic, social
    WeedSuggestion(text: "Play charades with friends 🤡", type: .sativa),
    WeedSuggestion(text: "Play Mario Kart with friends 🏎️", type: .sativa),
    WeedSuggestion(text: "Play Jackbox Party Pack 🕹️", type: .sativa),
    WeedSuggestion(text: "Play Pictionary 🎨", type: .sativa),
    WeedSuggestion(text: "Play Uno with friends 🃏", type: .sativa),
    WeedSuggestion(text: "Play a board game night 🎲", type: .sativa),
    WeedSuggestion(text: "Play Heads Up! on your phone 📱", type: .sativa),
    WeedSuggestion(text: "Play Twister 🌈", type: .sativa),
    WeedSuggestion(text: "Play a co-op video game 🎮", type: .sativa),
    WeedSuggestion(text: "Play Cards Against Humanity 😈", type: .sativa),
    WeedSuggestion(text: "Play trivia night 🧠", type: .sativa),
    WeedSuggestion(text: "Play Mafia/Werewolf 🐺", type: .sativa),
    WeedSuggestion(text: "Play Jenga 🏗️", type: .sativa),
    WeedSuggestion(text: "Play Truth or Dare 🤔", type: .sativa),
    WeedSuggestion(text: "Play Scattergories 🗂️", type: .sativa),
    WeedSuggestion(text: "Play telephone (the whisper game) 📣", type: .sativa),
    WeedSuggestion(text: "Play a VR game if available 🥽", type: .sativa),
    WeedSuggestion(text: "Play Just Dance 💃", type: .sativa),
    WeedSuggestion(text: "Play a rhythm game (like Beat Saber) 🥁", type: .sativa),
    WeedSuggestion(text: "Play a homemade obstacle course 🏃", type: .sativa),
    WeedSuggestion(text: "Play a word association game 📝", type: .sativa),
    WeedSuggestion(text: "Play a memory game 🧩", type: .sativa),
    WeedSuggestion(text: "Play freeze dance 🕺", type: .sativa),
    WeedSuggestion(text: "Play a scavenger hunt 🔍", type: .sativa),
    WeedSuggestion(text: "Play musical chairs 🎶", type: .sativa),
    WeedSuggestion(text: "Play improv games 🎭", type: .sativa),
    WeedSuggestion(text: "Play a collaborative puzzle 🧩", type: .sativa),
    WeedSuggestion(text: "Play Rock Band or Guitar Hero 🎸", type: .sativa),
    WeedSuggestion(text: "Play a guessing game 🤔", type: .sativa),
    WeedSuggestion(text: "Play a drawing game on tablet 🎨", type: .sativa),
    WeedSuggestion(text: "Play a group word game 🗣️", type: .sativa),
    WeedSuggestion(text: "Play hot potato 🥔", type: .sativa),
    // Hybrid — balanced, creative, social, food, music, etc.
    WeedSuggestion(text: "Cook a homemade pizza 🍕", type: .hybrid),
    WeedSuggestion(text: "Paint or draw something fun 🎨", type: .hybrid),
    WeedSuggestion(text: "Try writing a short poem ✒️", type: .hybrid),
    WeedSuggestion(text: "Make a new playlist and share it 🎶", type: .hybrid),
    WeedSuggestion(text: "Try origami folding 🦢", type: .hybrid),
    WeedSuggestion(text: "Make a vision board 🖼️", type: .hybrid),
    WeedSuggestion(text: "Bake cookies from scratch 🍪", type: .hybrid),
    WeedSuggestion(text: "Try a new smoothie recipe 🥤", type: .hybrid),
    WeedSuggestion(text: "Write a letter to your future self 💌", type: .hybrid),
    WeedSuggestion(text: "Make a friendship bracelet 🧵", type: .hybrid),
    WeedSuggestion(text: "Try a simple DIY craft 🛠️", type: .hybrid),
    WeedSuggestion(text: "Host a mini potluck with friends 🥗", type: .hybrid),
    WeedSuggestion(text: "Decorate your space with string lights 💡", type: .hybrid),
    WeedSuggestion(text: "Try a new board game 🧩", type: .hybrid),
    WeedSuggestion(text: "Make your own mocktail 🍹", type: .hybrid),
    WeedSuggestion(text: "Write a silly song and record it 🎤", type: .hybrid),
    WeedSuggestion(text: "Try a new dance move 🕺", type: .hybrid),
    WeedSuggestion(text: "Have a deep conversation with a friend 🧑‍🤝‍🧑", type: .hybrid),
    WeedSuggestion(text: "Try meditative coloring 🖍️", type: .hybrid),
    WeedSuggestion(text: "Plan a dream vacation ✈️", type: .hybrid),
    WeedSuggestion(text: "Try a new food delivery place 🍜", type: .hybrid),
    WeedSuggestion(text: "Make a TikTok or Reel 🎥", type: .hybrid),
    WeedSuggestion(text: "Read a random Wikipedia article 📚", type: .hybrid),
    WeedSuggestion(text: "Try to learn a magic trick 🪄", type: .hybrid),
    WeedSuggestion(text: "Make a gratitude list 📝", type: .hybrid),
    WeedSuggestion(text: "Try a new hairstyle 💇", type: .hybrid),
    WeedSuggestion(text: "Try a group meditation 🧘", type: .hybrid),
    WeedSuggestion(text: "Make a fruit salad 🍓", type: .hybrid),
    WeedSuggestion(text: "Do a mini photo shoot 📷", type: .hybrid),
    WeedSuggestion(text: "Try a group karaoke night 🎤", type: .hybrid),
    WeedSuggestion(text: "Make your own ice cream sundae 🍨", type: .hybrid),
    WeedSuggestion(text: "Try a group storytelling game 📖", type: .hybrid),
    WeedSuggestion(text: "Make a mood board for the season 🍁", type: .hybrid),
    WeedSuggestion(text: "Try a collaborative Spotify playlist 🎵", type: .hybrid)
]
