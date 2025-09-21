//
//  ActivitiesData.swift
//  BudBuddy
//
//  Created by Matteo Cola on 06.09.2025.
//

import Foundation



struct Activity: Identifiable {
    let id: UUID
    var title: String
    var subtitle: String
    var tags: [String]
    var isPublic: Bool
    var likes: Int
    var isFavorite: Bool
    var details: [String]
}



// Dummy Activities Data (conforming to the Activity struct defined elsewhere)
let mostQuotedActivities: [Activity] = [
    Activity(
        id: UUID(),
        title: "Hiking Adventure",
        subtitle: "Quoted by 120 users",
        tags: ["Fun", "Chill", "Outdoor"],
        isPublic: true,
        likes: 50,
        isFavorite: false,
        details: [
            "Explore the local trails",
            "Bring water and snacks",
            "Wear comfortable shoes",
            "Check the weather forecast",
            "Carry a map or GPS device",
            "Inform someone about your route"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Board Game Night",
        subtitle: "Quoted by 95 users",
        tags: ["Fun", "Indoor"],
        isPublic: true,
        likes: 40,
        isFavorite: false,
        details: [
            "Try new strategy games",
            "Invite friends over",
            "Prepare some snacks",
            "Set up a comfortable playing area",
            "Explain rules clearly before starting",
            "Keep score to add competition"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Cooking Class",
        subtitle: "Quoted by 80 users",
        tags: ["Creative", "Cooking", "Educational"],
        isPublic: true,
        likes: 30,
        isFavorite: false,
        details: [
            "Learn to cook Italian dishes",
            "Practice knife skills",
            "Experiment with spices",
            "Follow recipes step-by-step",
            "Taste test as you go",
            "Clean as you cook to stay organized"
        ]
    ),
    // New activities start here
    Activity(
        id: UUID(),
        title: "Watch 'Our Planet' on Netflix",
        subtitle: "Quoted by 150 users",
        tags: ["Relaxing", "Educational", "Indoor"],
        isPublic: true,
        likes: 65,
        isFavorite: false,
        details: [
            "Choose an episode based on your favorite animals",
            "Prepare a cozy spot with blankets and snacks",
            "Watch with friends or family for discussion",
            "Take notes on interesting facts",
            "Share your favorite scenes afterward"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Try a YouTube tutorial on acrylic painting",
        subtitle: "Quoted by 110 users",
        tags: ["Art", "Creative", "Indoor"],
        isPublic: true,
        likes: 52,
        isFavorite: false,
        details: [
            "Search for beginner-friendly acrylic tutorials",
            "Gather all painting supplies before starting",
            "Pause the video to follow along at your own pace",
            "Experiment with colors and textures",
            "Share your finished painting online"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Listen to Pink Floyd and try light painting",
        subtitle: "Quoted by 102 users",
        tags: ["Music", "Creative", "Art"],
        isPublic: true,
        likes: 47,
        isFavorite: false,
        details: [
            "Set up a dark room and grab a flashlight",
            "Play your favorite Pink Floyd album",
            "Use long exposure camera settings",
            "Move the light source to create patterns",
            "Review and share your light art photos"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Bake cannabis-infused brownies following this recipe",
        subtitle: "Quoted by 88 users",
        tags: ["Cooking", "Creative", "Relaxing"],
        isPublic: true,
        likes: 39,
        isFavorite: false,
        details: [
            "Gather all ingredients and follow the recipe",
            "Ensure proper decarboxylation of cannabis",
            "Mix ingredients thoroughly for even potency",
            "Bake at the recommended temperature",
            "Let brownies cool before serving"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Outdoor Picnic in the Park",
        subtitle: "Quoted by 90 users",
        tags: ["Chill", "Outdoor", "Relaxing"],
        isPublic: true,
        likes: 44,
        isFavorite: false,
        details: [
            "Pack a blanket, snacks, and drinks",
            "Choose a scenic spot in your local park",
            "Bring a speaker for background music",
            "Play lawn games like frisbee or bocce",
            "Clean up your area before leaving"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Learn a new language with Duolingo",
        subtitle: "Quoted by 70 users",
        tags: ["Educational", "Indoor", "Relaxing"],
        isPublic: true,
        likes: 36,
        isFavorite: false,
        details: [
            "Download the Duolingo app",
            "Set a daily practice goal",
            "Practice vocabulary and pronunciation",
            "Join a language club for motivation",
            "Track your progress weekly"
        ]
    ),
    Activity(
        id: UUID(),
        title: "DIY Terrarium Building",
        subtitle: "Quoted by 78 users",
        tags: ["Creative", "Indoor", "Relaxing"],
        isPublic: true,
        likes: 33,
        isFavorite: false,
        details: [
            "Gather glass containers, soil, and small plants",
            "Layer stones, charcoal, and soil for drainage",
            "Arrange plants and decorative items",
            "Water lightly to avoid mold",
            "Display your terrarium in a bright spot"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Stargazing Night",
        subtitle: "Quoted by 84 users",
        tags: ["Chill", "Outdoor", "Educational"],
        isPublic: true,
        likes: 41,
        isFavorite: false,
        details: [
            "Find a dark location with little light pollution",
            "Bring a blanket or reclining chair",
            "Use a stargazing app to identify constellations",
            "Pack snacks and warm drinks",
            "Try taking photos of the night sky"
        ]
    ),
    Activity(
        id: UUID(),
        title: "DIY Tie-Dye T-Shirts",
        subtitle: "Quoted by 77 users",
        tags: ["Art", "Creative", "Indoor"],
        isPublic: true,
        likes: 38,
        isFavorite: false,
        details: [
            "Buy plain white shirts and tie-dye kits",
            "Twist shirts into patterns and secure with rubber bands",
            "Apply different dye colors as desired",
            "Let shirts sit for several hours",
            "Rinse and wash separately before wearing"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Host a Cannabis Strain Tasting",
        subtitle: "Quoted by 62 users",
        tags: ["Fun", "Indoor", "Relaxing"],
        isPublic: true,
        likes: 29,
        isFavorite: false,
        details: [
            "Select a variety of strains to sample",
            "Prepare tasting cards for notes",
            "Invite friends and set a relaxed mood",
            "Discuss flavors and effects after each sample",
            "Stay hydrated and consume responsibly"
        ]
    ),
    // Add more activities as needed to reach 50 new entries
    Activity(
        id: UUID(),
        title: "Learn Guitar Chords Online",
        subtitle: "Quoted by 75 users",
        tags: ["Music", "Educational", "Indoor"],
        isPublic: true,
        likes: 37,
        isFavorite: false,
        details: [
            "Find beginner guitar lessons on YouTube",
            "Practice basic chords daily",
            "Play along with simple songs",
            "Record yourself to track progress",
            "Join online forums for tips"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Sunset Meditation at the Beach",
        subtitle: "Quoted by 68 users",
        tags: ["Chill", "Outdoor", "Relaxing"],
        isPublic: true,
        likes: 32,
        isFavorite: false,
        details: [
            "Arrive at the beach before sunset",
            "Find a quiet spot to sit",
            "Close your eyes and focus on your breath",
            "Listen to the waves and seagulls",
            "Reflect on your day as the sun sets"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Host a Cannabis-Infused Cooking Night",
        subtitle: "Quoted by 59 users",
        tags: ["Cooking", "Fun", "Indoor"],
        isPublic: true,
        likes: 28,
        isFavorite: false,
        details: [
            "Choose recipes for appetizers, mains, and desserts",
            "Infuse oils or butters with cannabis",
            "Cook together as a group",
            "Share and taste each dish",
            "Discuss effects and flavors"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Nature Sketching in the Park",
        subtitle: "Quoted by 80 users",
        tags: ["Art", "Outdoor", "Relaxing"],
        isPublic: true,
        likes: 35,
        isFavorite: false,
        details: [
            "Bring a sketchbook and pencils",
            "Find a comfortable bench or grassy spot",
            "Observe trees, flowers, or wildlife",
            "Sketch what inspires you",
            "Share your drawings with friends"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Karaoke Night at Home",
        subtitle: "Quoted by 92 users",
        tags: ["Music", "Fun", "Indoor"],
        isPublic: true,
        likes: 43,
        isFavorite: false,
        details: [
            "Set up a karaoke machine or use YouTube",
            "Make a playlist of favorite songs",
            "Sing solo or in groups",
            "Record performances for laughs",
            "Vote for the best singer of the night"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Home Spa Day",
        subtitle: "Quoted by 83 users",
        tags: ["Relaxing", "Indoor", "Chill"],
        isPublic: true,
        likes: 40,
        isFavorite: false,
        details: [
            "Prepare face masks and soothing music",
            "Take a warm bath with bath salts",
            "Give yourself a manicure or pedicure",
            "Light candles for ambiance",
            "Relax with herbal tea afterward"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Write Poetry Inspired by Nature",
        subtitle: "Quoted by 66 users",
        tags: ["Creative", "Art", "Relaxing"],
        isPublic: true,
        likes: 27,
        isFavorite: false,
        details: [
            "Take a walk outdoors for inspiration",
            "Bring a notebook to jot down ideas",
            "Write free verse or structured poems",
            "Share your poems with friends",
            "Consider submitting to a poetry contest"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Attend a Virtual Museum Tour",
        subtitle: "Quoted by 71 users",
        tags: ["Educational", "Art", "Indoor"],
        isPublic: true,
        likes: 34,
        isFavorite: false,
        details: [
            "Choose a museum's online tour (e.g., Louvre, MoMA)",
            "Explore different exhibits and artists",
            "Take screenshots of favorite pieces",
            "Read descriptions and histories",
            "Discuss your favorite works afterward"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Try Origami Folding",
        subtitle: "Quoted by 64 users",
        tags: ["Creative", "Art", "Indoor"],
        isPublic: true,
        likes: 31,
        isFavorite: false,
        details: [
            "Get origami paper or cut regular paper into squares",
            "Follow step-by-step folding videos",
            "Start with simple shapes like cranes or boats",
            "Display your creations around your home",
            "Gift origami to friends or family"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Create a Vision Board",
        subtitle: "Quoted by 69 users",
        tags: ["Creative", "Chill", "Indoor"],
        isPublic: true,
        likes: 33,
        isFavorite: false,
        details: [
            "Gather magazines, scissors, and glue",
            "Cut out images and words that inspire you",
            "Arrange and glue them onto a poster board",
            "Reflect on your goals while creating",
            "Hang your vision board somewhere visible"
        ]
    ),
    // 20 new video/movie watching activities focused on stunning, trippy, existential, or creative experiences
    Activity(
        id: UUID(),
        title: "Watch '2001: A Space Odyssey'",
        subtitle: "Quoted by 38 users",
        tags: ["Indoor", "Trippy", "Stunning Visuals", "Existential"],
        isPublic: true,
        likes: 29,
        isFavorite: false,
        details: [
            "Dim the lights for a cinematic atmosphere",
            "Watch with a good sound system or headphones",
            "Focus on the visuals during the Stargate sequence",
            "Reflect on the film's themes after watching",
            "Discuss interpretations with friends"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Planet Earth II' Episode 3: Jungles",
        subtitle: "Quoted by 22 users",
        tags: ["Indoor", "Stunning Visuals", "Relaxing"],
        isPublic: true,
        likes: 17,
        isFavorite: false,
        details: [
            "Choose a high-definition screen if possible",
            "Prepare your favorite snacks",
            "Immerse yourself in the colorful animal footage",
            "Listen closely to David Attenborough's narration",
            "Pause to appreciate breathtaking scenes"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Enter the Void'",
        subtitle: "Quoted by 15 users",
        tags: ["Indoor", "Trippy", "Stunning Visuals"],
        isPublic: true,
        likes: 14,
        isFavorite: false,
        details: [
            "Watch in a dark room for full effect",
            "Pay attention to the film's unique camera work",
            "Let yourself be absorbed by the neon visuals",
            "Take breaks if the visuals become overwhelming",
            "Discuss the film's experimental style afterward"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Fantastic Fungi' Documentary",
        subtitle: "Quoted by 19 users",
        tags: ["Indoor", "Stunning Visuals", "Educational", "Relaxing"],
        isPublic: true,
        likes: 16,
        isFavorite: false,
        details: [
            "Enjoy the time-lapse mushroom footage",
            "Take notes on interesting facts about fungi",
            "Watch with someone who loves nature",
            "Pause to admire the visuals",
            "Share your favorite insights after"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Baraka'",
        subtitle: "Quoted by 27 users",
        tags: ["Indoor", "Stunning Visuals", "Existential"],
        isPublic: true,
        likes: 21,
        isFavorite: false,
        details: [
            "Set aside time for uninterrupted viewing",
            "Focus on the imagery and music",
            "Notice the film's global perspective",
            "Reflect on the themes of nature and humanity",
            "Discuss your emotional reactions afterward"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'The Midnight Gospel' on Netflix",
        subtitle: "Quoted by 24 users",
        tags: ["Indoor", "Trippy", "Existential", "Creative"],
        isPublic: true,
        likes: 18,
        isFavorite: false,
        details: [
            "Watch an episode with headphones for immersive sound",
            "Pay attention to the surreal animation",
            "Pause to reflect on deep philosophical conversations",
            "Draw or doodle inspired by the visuals",
            "Share favorite quotes with friends"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Samsara'",
        subtitle: "Quoted by 16 users",
        tags: ["Indoor", "Stunning Visuals", "Existential"],
        isPublic: true,
        likes: 13,
        isFavorite: false,
        details: [
            "Watch on the largest screen available",
            "Notice patterns and cycles in the imagery",
            "Let the music guide your emotions",
            "Reflect on the interconnectedness of life",
            "Share your thoughts with a friend after"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Waking Life'",
        subtitle: "Quoted by 18 users",
        tags: ["Indoor", "Trippy", "Existential", "Creative"],
        isPublic: true,
        likes: 15,
        isFavorite: false,
        details: [
            "Focus on the unique rotoscope animation",
            "Pause to discuss the philosophical ideas",
            "Watch with a friend for a deeper experience",
            "Take notes on ideas that resonate",
            "Let the film inspire your own dreams"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Koyaanisqatsi'",
        subtitle: "Quoted by 14 users",
        tags: ["Indoor", "Stunning Visuals", "Existential"],
        isPublic: true,
        likes: 12,
        isFavorite: false,
        details: [
            "Watch with the volume up for the Philip Glass score",
            "Notice the film's rhythm and editing",
            "Reflect on the contrast between nature and technology",
            "Let yourself be mesmerized by time-lapse sequences",
            "Share your interpretation with friends"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Spirited Away'",
        subtitle: "Quoted by 35 users",
        tags: ["Indoor", "Stunning Visuals", "Creative", "Relaxing"],
        isPublic: true,
        likes: 26,
        isFavorite: false,
        details: [
            "Prepare Japanese snacks for the mood",
            "Admire the hand-drawn animation",
            "Notice details in the fantastical world",
            "Let yourself be swept up in the story",
            "Discuss the characters afterward"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'The Grand Budapest Hotel'",
        subtitle: "Quoted by 21 users",
        tags: ["Indoor", "Stunning Visuals", "Creative"],
        isPublic: true,
        likes: 18,
        isFavorite: false,
        details: [
            "Appreciate Wes Anderson's color palettes",
            "Notice the symmetry in every shot",
            "Enjoy the quirky humor and characters",
            "Pause to admire set designs",
            "Share your favorite scenes with friends"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Blade Runner 2049'",
        subtitle: "Quoted by 26 users",
        tags: ["Indoor", "Stunning Visuals", "Existential", "Trippy"],
        isPublic: true,
        likes: 20,
        isFavorite: false,
        details: [
            "Watch in a dark room for the best visuals",
            "Listen closely to the atmospheric soundtrack",
            "Reflect on the film's questions about identity",
            "Pause to appreciate the cinematography",
            "Discuss theories about the story afterward"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Love, Death & Robots' on Netflix",
        subtitle: "Quoted by 23 users",
        tags: ["Indoor", "Creative", "Trippy", "Stunning Visuals"],
        isPublic: true,
        likes: 19,
        isFavorite: false,
        details: [
            "Pick a few short episodes to binge",
            "Notice the different animation styles",
            "Discuss your favorite stories and visuals",
            "Reflect on the show's existential themes",
            "Draw or write inspired by the episodes"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Annihilation'",
        subtitle: "Quoted by 17 users",
        tags: ["Indoor", "Trippy", "Stunning Visuals", "Existential"],
        isPublic: true,
        likes: 14,
        isFavorite: false,
        details: [
            "Watch with minimal distractions",
            "Pay attention to the use of color and sound",
            "Let yourself be drawn into the mystery",
            "Pause to discuss strange or unsettling scenes",
            "Share theories with friends after"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Yellow Submarine' (The Beatles)",
        subtitle: "Quoted by 13 users",
        tags: ["Indoor", "Trippy", "Creative"],
        isPublic: true,
        likes: 11,
        isFavorite: false,
        details: [
            "Sing along with classic Beatles songs",
            "Enjoy the psychedelic animation style",
            "Watch with friends for a fun experience",
            "Notice the playful humor throughout",
            "Let the visuals inspire your own art"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Akira'",
        subtitle: "Quoted by 20 users",
        tags: ["Indoor", "Stunning Visuals", "Trippy"],
        isPublic: true,
        likes: 16,
        isFavorite: false,
        details: [
            "Watch in Japanese with subtitles for authenticity",
            "Appreciate the hand-drawn animation and cityscapes",
            "Notice the film's influence on pop culture",
            "Reflect on the story's existential themes",
            "Discuss your favorite scenes after"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'The Tree of Life'",
        subtitle: "Quoted by 12 users",
        tags: ["Indoor", "Stunning Visuals", "Existential"],
        isPublic: true,
        likes: 10,
        isFavorite: false,
        details: [
            "Allow yourself to experience the film's flow",
            "Focus on the interplay of visuals and music",
            "Reflect on the film's themes about life and family",
            "Watch with someone open to abstract cinema",
            "Discuss your interpretation afterward"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'The Secret Life of Walter Mitty'",
        subtitle: "Quoted by 18 users",
        tags: ["Indoor", "Stunning Visuals", "Creative", "Relaxing"],
        isPublic: true,
        likes: 15,
        isFavorite: false,
        details: [
            "Watch for inspiration and adventure vibes",
            "Notice the stunning landscapes and cinematography",
            "Let the soundtrack lift your spirits",
            "Reflect on your own dreams and goals",
            "Share your favorite moments with friends"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Doctor Strange' (Marvel)",
        subtitle: "Quoted by 25 users",
        tags: ["Indoor", "Trippy", "Stunning Visuals", "Creative"],
        isPublic: true,
        likes: 20,
        isFavorite: false,
        details: [
            "Watch in HD for maximum effect",
            "Pay attention to the mind-bending visual sequences",
            "Let yourself be immersed in the magical world",
            "Pause to discuss the film's creative ideas",
            "Try drawing your own mystical patterns afterward"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Song of the Sea'",
        subtitle: "Quoted by 11 users",
        tags: ["Indoor", "Stunning Visuals", "Creative", "Relaxing"],
        isPublic: true,
        likes: 9,
        isFavorite: false,
        details: [
            "Watch with a cozy blanket and a warm drink",
            "Enjoy the hand-drawn animation style",
            "Listen for the beautiful soundtrack",
            "Notice the folklore elements in the story",
            "Share the film with someone who loves animation"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Cosmos: A Spacetime Odyssey' Episode 1",
        subtitle: "Quoted by 16 users",
        tags: ["Indoor", "Stunning Visuals", "Educational", "Existential"],
        isPublic: true,
        likes: 13,
        isFavorite: false,
        details: [
            "Watch on a big screen if possible",
            "Take notes on mind-blowing facts about the universe",
            "Let the visuals and music inspire awe",
            "Pause to reflect on the scale of the cosmos",
            "Share interesting facts with friends"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Watch 'Kubo and the Two Strings'",
        subtitle: "Quoted by 14 users",
        tags: ["Indoor", "Stunning Visuals", "Creative"],
        isPublic: true,
        likes: 12,
        isFavorite: false,
        details: [
            "Notice the stop-motion animation techniques",
            "Enjoy the magical storytelling",
            "Pay attention to the film's themes of family and courage",
            "Watch with friends or family for discussion",
            "Let the visuals inspire your own creativity"
        ]
    ),
]

let lastCreatedActivities: [Activity] = [
    Activity(
        id: UUID(),
        title: "Yoga Session",
        subtitle: "Created 2 days ago",
        tags: ["Chill", "Relaxing", "Indoor"],
        isPublic: true,
        likes: 15,
        isFavorite: false,
        details: [
            "Follow a 30-minute beginner video",
            "Focus on breathing",
            "Use a yoga mat",
            "Wear comfortable clothing",
            "Practice mindfulness and relaxation",
            "Cool down with gentle stretches"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Photography Walk",
        subtitle: "Created 5 days ago",
        tags: ["Creative", "Outdoor", "Art"],
        isPublic: true,
        likes: 20,
        isFavorite: false,
        details: [
            "Capture nature photos",
            "Experiment with lighting",
            "Share on social media",
            "Try different angles and perspectives",
            "Use manual settings for better control",
            "Review and edit photos afterwards"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Book Club",
        subtitle: "Created 1 week ago",
        tags: ["Fun", "Educational", "Indoor"],
        isPublic: true,
        likes: 25,
        isFavorite: false,
        details: [
            "Read the monthly book",
            "Join weekly discussions",
            "Invite friends to join",
            "Prepare questions and topics",
            "Share favorite quotes",
            "Plan the next book selection"
        ]
    ),
    // New activities
    Activity(
        id: UUID(),
        title: "Make a Cannabis-Infused Smoothie",
        subtitle: "Created 4 hours ago",
        tags: ["Cooking", "Creative", "Relaxing"],
        isPublic: true,
        likes: 8,
        isFavorite: false,
        details: [
            "Select your favorite fruits and greens",
            "Prepare cannabis-infused coconut oil",
            "Blend all ingredients thoroughly",
            "Serve chilled with a garnish",
            "Enjoy responsibly and share with friends"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Try Guided Meditation with Music",
        subtitle: "Created 8 hours ago",
        tags: ["Music", "Relaxing", "Indoor"],
        isPublic: true,
        likes: 10,
        isFavorite: false,
        details: [
            "Find a guided meditation playlist online",
            "Set up a quiet space with dim lighting",
            "Wear headphones for better focus",
            "Follow the audio instructions",
            "Reflect on your experience afterward"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Create a DIY Candle",
        subtitle: "Created 1 day ago",
        tags: ["Creative", "Indoor", "Art"],
        isPublic: true,
        likes: 12,
        isFavorite: false,
        details: [
            "Gather wax, wicks, and essential oils",
            "Melt wax safely in a double boiler",
            "Add scents and colors as desired",
            "Pour into molds and insert wicks",
            "Let candles cool before using"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Take a Virtual Cooking Class",
        subtitle: "Created 3 days ago",
        tags: ["Cooking", "Educational", "Indoor"],
        isPublic: true,
        likes: 14,
        isFavorite: false,
        details: [
            "Sign up for an online cooking class",
            "Prepare ingredients ahead of time",
            "Follow the chef’s instructions live",
            "Ask questions in the chat",
            "Share photos of your finished dish"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Host a Cannabis Trivia Night",
        subtitle: "Created 6 days ago",
        tags: ["Fun", "Educational", "Indoor"],
        isPublic: true,
        likes: 11,
        isFavorite: false,
        details: [
            "Prepare trivia questions about cannabis history and culture",
            "Invite friends to join via video call",
            "Keep score and offer small prizes",
            "Mix in fun facts between rounds",
            "End with a group discussion"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Nature Sound Recording Walk",
        subtitle: "Created 1 day ago",
        tags: ["Outdoor", "Music", "Chill"],
        isPublic: true,
        likes: 9,
        isFavorite: false,
        details: [
            "Bring a portable audio recorder or smartphone",
            "Walk through a natural area listening for unique sounds",
            "Record bird calls, wind, or running water",
            "Edit your favorite clips at home",
            "Create a relaxing soundscape playlist"
        ]
    ),
    // ... (Continue adding more activities to reach 50 new entries)
]

let favoriteActivities: [Activity] = [
    Activity(
        id: UUID(),
        title: "Movie Marathon",
        subtitle: "Your favorite",
        tags: ["Fun", "Indoor", "Relaxing"],
        isPublic: false,
        likes: 60,
        isFavorite: true,
        details: [
            "Watch classic movies",
            "Prepare popcorn",
            "Invite friends for a night in",
            "Set up a cozy viewing area",
            "Create a movie schedule",
            "Discuss movies during breaks"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Beach Volleyball",
        subtitle: "Your favorite",
        tags: ["Fun", "Outdoor"],
        isPublic: false,
        likes: 55,
        isFavorite: true,
        details: [
            "Gather a team of players",
            "Practice serves and spikes",
            "Stay hydrated",
            "Warm up before playing",
            "Use sunscreen to protect skin",
            "Have fun and encourage teammates"
        ]
    ),
    // New favorites
    Activity(
        id: UUID(),
        title: "Make a Cannabis-Infused Pizza",
        subtitle: "Your favorite",
        tags: ["Cooking", "Fun", "Creative"],
        isPublic: false,
        likes: 48,
        isFavorite: true,
        details: [
            "Prepare pizza dough from scratch or use store-bought",
            "Infuse olive oil with cannabis",
            "Add your favorite toppings",
            "Bake until crust is golden",
            "Slice and enjoy with friends"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Record a Song with Friends",
        subtitle: "Your favorite",
        tags: ["Music", "Creative", "Indoor"],
        isPublic: false,
        likes: 42,
        isFavorite: true,
        details: [
            "Write simple lyrics together",
            "Choose instruments or use digital apps",
            "Record vocals and music on your phone",
            "Mix and edit for fun",
            "Share your song online"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Paint Mandalas for Relaxation",
        subtitle: "Your favorite",
        tags: ["Art", "Relaxing", "Creative"],
        isPublic: false,
        likes: 38,
        isFavorite: true,
        details: [
            "Print or draw mandala outlines",
            "Use markers, paints, or colored pencils",
            "Fill in patterns with vibrant colors",
            "Focus on the process for mindfulness",
            "Display your mandalas at home"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Backyard Stargazing Party",
        subtitle: "Your favorite",
        tags: ["Outdoor", "Chill", "Educational"],
        isPublic: false,
        likes: 36,
        isFavorite: true,
        details: [
            "Set up blankets and telescopes in your backyard",
            "Invite friends for a night under the stars",
            "Use a stargazing app to identify constellations",
            "Bring snacks and drinks",
            "Take turns sharing astronomy facts"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Make Your Own Bath Bombs",
        subtitle: "Your favorite",
        tags: ["Creative", "Relaxing", "Indoor"],
        isPublic: false,
        likes: 33,
        isFavorite: true,
        details: [
            "Mix baking soda, citric acid, and Epsom salt",
            "Add essential oils and coloring",
            "Press mixture into molds",
            "Let bath bombs dry overnight",
            "Enjoy a relaxing bath with your creations"
        ]
    ),
    // ... (Continue adding more favorite activities)
]

let createdActivities: [Activity] = [
    Activity(
        id: UUID(),
        title: "Gardening Workshop",
        subtitle: "Created by you",
        tags: ["Chill", "Outdoor", "Educational"],
        isPublic: false,
        likes: 10,
        isFavorite: false,
        details: [
            "Learn about plant care",
            "Plant seasonal flowers",
            "Use organic fertilizers",
            "Water plants regularly",
            "Prune dead leaves",
            "Keep a gardening journal"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Painting Class",
        subtitle: "Created by you",
        tags: ["Creative", "Art", "Indoor"],
        isPublic: false,
        likes: 12,
        isFavorite: false,
        details: [
            "Try watercolor techniques",
            "Paint a landscape",
            "Experiment with color mixing",
            "Prepare your brushes and canvas",
            "Practice different brush strokes",
            "Clean brushes thoroughly after use"
        ]
    ),
    // New created activities
    Activity(
        id: UUID(),
        title: "Host a Cannabis Tea Party",
        subtitle: "Created by you",
        tags: ["Chill", "Cooking", "Fun"],
        isPublic: false,
        likes: 7,
        isFavorite: false,
        details: [
            "Brew cannabis-infused herbal teas",
            "Set out a selection of snacks",
            "Invite friends for a relaxed afternoon",
            "Decorate with flowers and candles",
            "Share your favorite tea blends"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Create a DIY Herb Garden Indoors",
        subtitle: "Created by you",
        tags: ["Creative", "Indoor", "Educational"],
        isPublic: false,
        likes: 9,
        isFavorite: false,
        details: [
            "Choose herbs like basil, mint, and parsley",
            "Plant seeds in small pots or containers",
            "Place pots on a sunny windowsill",
            "Water regularly and trim as needed",
            "Use fresh herbs in your cooking"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Design Your Own Comic Strip",
        subtitle: "Created by you",
        tags: ["Art", "Creative", "Indoor"],
        isPublic: false,
        likes: 8,
        isFavorite: false,
        details: [
            "Brainstorm a short story or joke",
            "Draw panels with characters and speech bubbles",
            "Color your comic for extra flair",
            "Share with friends or online",
            "Try making a series if you enjoy it"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Host a Cannabis-Infused Brunch",
        subtitle: "Created by you",
        tags: ["Cooking", "Fun", "Creative"],
        isPublic: false,
        likes: 11,
        isFavorite: false,
        details: [
            "Plan a brunch menu with infused dishes",
            "Prepare cannabis-infused butter or oil",
            "Invite friends for a relaxed morning",
            "Set a beautiful table with flowers",
            "Enjoy good food and conversation"
        ]
    ),
    Activity(
        id: UUID(),
        title: "Build a Birdhouse",
        subtitle: "Created by you",
        tags: ["Creative", "Outdoor", "Educational"],
        isPublic: false,
        likes: 6,
        isFavorite: false,
        details: [
            "Gather wood, nails, and paint",
            "Follow a simple birdhouse design",
            "Assemble the pieces using a hammer",
            "Paint and decorate your birdhouse",
            "Hang it in your yard and watch for birds"
        ]
    ),
    // ... (Continue adding more created activities)
]
