import Foundation

struct CannabisRecipe: Identifiable {
    let id: UUID
    let title: String
    let description: String
    let ingredients: [String]
    let instructions: [String]
    let prepTime: String
    let cookTime: String
    let servings: Int
    let difficulty: String
    let flavors: [String]
}

let cannabisRecipes: [CannabisRecipe] = [
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis Chocolate Brownies",
        description: "Rich and fudgy brownies infused with cannabis butter for a relaxing treat.",
        ingredients: [
            "1 cup cannabis-infused butter",
            "2 cups sugar",
            "4 large eggs",
            "1 1/2 cups all-purpose flour",
            "1 cup cocoa powder",
            "1 tsp salt",
            "1 tsp baking powder",
            "1 tsp vanilla extract"
        ],
        instructions: [
            "Preheat oven to 350°F (175°C).",
            "Melt cannabis butter and mix with sugar.",
            "Add eggs one at a time, then vanilla.",
            "Sift together flour, cocoa, salt, and baking powder.",
            "Combine wet and dry ingredients.",
            "Pour into greased baking pan.",
            "Bake for 25-30 minutes.",
            "Cool before slicing."
        ],
        prepTime: "15 minutes",
        cookTime: "30 minutes",
        servings: 12,
        difficulty: "Intermediate",
        flavors: ["Chocolatey", "Sweet"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Mango Smoothie",
        description: "A tropical mango smoothie with a cannabis twist, perfect for a refreshing and calming drink.",
        ingredients: [
            "1 cup frozen mango chunks",
            "1/2 cup coconut milk",
            "1/2 cup orange juice",
            "1 tbsp cannabis tincture",
            "1 tbsp honey",
            "Ice cubes"
        ],
        instructions: [
            "Combine all ingredients in a blender.",
            "Blend until smooth.",
            "Pour into a glass and serve chilled."
        ],
        prepTime: "5 minutes",
        cookTime: "0 minutes",
        servings: 1,
        difficulty: "Easy",
        flavors: ["Fruity", "Tropical", "Sweet"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Savory Cannabis-Infused Garlic Butter Chicken",
        description: "Juicy chicken breasts cooked in a garlic cannabis butter sauce, perfect for a savory dinner.",
        ingredients: [
            "4 chicken breasts",
            "1/2 cup cannabis-infused butter",
            "4 cloves garlic, minced",
            "1 tsp dried thyme",
            "Salt and pepper to taste",
            "Fresh parsley for garnish"
        ],
        instructions: [
            "Preheat skillet over medium heat.",
            "Season chicken with salt, pepper, and thyme.",
            "Melt cannabis butter in skillet and add garlic.",
            "Cook chicken 6-7 minutes per side until cooked through.",
            "Spoon garlic butter over chicken while cooking.",
            "Garnish with parsley and serve."
        ],
        prepTime: "10 minutes",
        cookTime: "15 minutes",
        servings: 4,
        difficulty: "Intermediate",
        flavors: ["Savory", "Garlic", "Herbaceous"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Classic Guacamole",
        description: "A creamy and zesty guacamole with a subtle cannabis infusion, perfect for snacks or parties.",
        ingredients: [
            "3 ripe avocados",
            "1 tbsp cannabis-infused olive oil",
            "1 small onion, finely chopped",
            "1 tomato, diced",
            "1 lime, juiced",
            "1 clove garlic, minced",
            "Salt and pepper to taste",
            "Fresh cilantro, chopped"
        ],
        instructions: [
            "Mash avocados in a bowl.",
            "Mix in cannabis olive oil, onion, tomato, lime juice, and garlic.",
            "Season with salt and pepper.",
            "Stir in cilantro.",
            "Serve immediately with chips."
        ],
        prepTime: "10 minutes",
        cookTime: "0 minutes",
        servings: 4,
        difficulty: "Easy",
        flavors: ["Savory", "Citrus", "Herbaceous"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Honey Lemon Tea",
        description: "A soothing hot tea with cannabis-infused honey and fresh lemon, great for relaxation.",
        ingredients: [
            "1 cup hot water",
            "1 tbsp cannabis-infused honey",
            "1 tbsp fresh lemon juice",
            "1 tea bag (green or chamomile)"
        ],
        instructions: [
            "Steep tea bag in hot water for 3-5 minutes.",
            "Remove tea bag and stir in cannabis honey and lemon juice.",
            "Serve warm."
        ],
        prepTime: "2 minutes",
        cookTime: "5 minutes",
        servings: 1,
        difficulty: "Easy",
        flavors: ["Citrus", "Sweet", "Floral"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Pesto Pasta",
        description: "Fresh homemade pesto with cannabis olive oil tossed with al dente pasta for a flavorful meal.",
        ingredients: [
            "2 cups fresh basil leaves",
            "1/2 cup cannabis-infused olive oil",
            "1/3 cup pine nuts",
            "2 cloves garlic",
            "1/2 cup grated Parmesan cheese",
            "Salt and pepper to taste",
            "12 oz pasta"
        ],
        instructions: [
            "Cook pasta according to package instructions.",
            "Combine basil, pine nuts, garlic, and Parmesan in a food processor.",
            "Slowly add cannabis olive oil while blending.",
            "Season pesto with salt and pepper.",
            "Toss pesto with cooked pasta and serve."
        ],
        prepTime: "15 minutes",
        cookTime: "12 minutes",
        servings: 4,
        difficulty: "Intermediate",
        flavors: ["Herbaceous", "Savory", "Nutty"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Strawberry Shortcake",
        description: "Light and fluffy shortcakes layered with cannabis-infused whipped cream and fresh strawberries.",
        ingredients: [
            "2 cups all-purpose flour",
            "1/4 cup sugar",
            "1 tbsp baking powder",
            "1/2 tsp salt",
            "1/2 cup cold cannabis-infused butter",
            "2/3 cup milk",
            "2 cups sliced strawberries",
            "1 cup heavy cream",
            "2 tbsp cannabis-infused sugar"
        ],
        instructions: [
            "Preheat oven to 425°F (220°C).",
            "Mix flour, sugar, baking powder, and salt.",
            "Cut in cold cannabis butter until mixture resembles coarse crumbs.",
            "Stir in milk to form dough.",
            "Drop dough onto baking sheet and bake 12-15 minutes.",
            "Whip heavy cream with cannabis sugar until soft peaks form.",
            "Split shortcakes, layer with strawberries and whipped cream."
        ],
        prepTime: "20 minutes",
        cookTime: "15 minutes",
        servings: 6,
        difficulty: "Intermediate",
        flavors: ["Sweet", "Fruity", "Creamy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Spicy Buffalo Wings",
        description: "Crispy chicken wings tossed in a cannabis-infused spicy buffalo sauce for an addictive snack.",
        ingredients: [
            "2 lbs chicken wings",
            "1/2 cup cannabis-infused butter",
            "1/2 cup hot sauce",
            "1 tbsp garlic powder",
            "Salt and pepper to taste",
            "Celery sticks and blue cheese dressing for serving"
        ],
        instructions: [
            "Preheat oven to 400°F (200°C).",
            "Season wings with salt, pepper, and garlic powder.",
            "Bake wings for 40-45 minutes until crispy.",
            "Melt cannabis butter and mix with hot sauce.",
            "Toss wings in buffalo sauce.",
            "Serve with celery and blue cheese dressing."
        ],
        prepTime: "10 minutes",
        cookTime: "45 minutes",
        servings: 4,
        difficulty: "Intermediate",
        flavors: ["Spicy", "Savory", "Buttery"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Vanilla Bean Ice Cream",
        description: "Creamy homemade vanilla ice cream infused with cannabis for a smooth and mellow dessert.",
        ingredients: [
            "2 cups heavy cream",
            "1 cup whole milk",
            "3/4 cup sugar",
            "1 vanilla bean, split",
            "4 egg yolks",
            "2 tbsp cannabis tincture"
        ],
        instructions: [
            "Heat cream, milk, sugar, and vanilla bean to simmer.",
            "Whisk egg yolks and temper with hot cream mixture.",
            "Cook until thickened, then cool.",
            "Stir in cannabis tincture.",
            "Churn in ice cream maker according to manufacturer.",
            "Freeze until firm."
        ],
        prepTime: "20 minutes",
        cookTime: "15 minutes",
        servings: 6,
        difficulty: "Advanced",
        flavors: ["Sweet", "Creamy", "Vanilla"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Guava BBQ Sauce",
        description: "Sweet and tangy guava BBQ sauce with a cannabis-infused kick, perfect for grilling season.",
        ingredients: [
            "1 cup guava paste",
            "1/2 cup ketchup",
            "1/4 cup apple cider vinegar",
            "2 tbsp cannabis-infused olive oil",
            "1 tbsp Worcestershire sauce",
            "1 tsp smoked paprika",
            "Salt and pepper to taste"
        ],
        instructions: [
            "Combine all ingredients in saucepan.",
            "Simmer on low heat for 15 minutes, stirring frequently.",
            "Cool and store in refrigerator.",
            "Use as a glaze or dipping sauce."
        ],
        prepTime: "5 minutes",
        cookTime: "15 minutes",
        servings: 8,
        difficulty: "Easy",
        flavors: ["Sweet", "Tangy", "Smoky"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Lemon Bars",
        description: "Tangy and sweet lemon bars with a cannabis-infused buttery crust for a refreshing dessert.",
        ingredients: [
            "1 cup all-purpose flour",
            "1/4 cup powdered sugar",
            "1/2 cup cannabis-infused butter, softened",
            "2 large eggs",
            "3/4 cup granulated sugar",
            "2 tbsp all-purpose flour",
            "1/4 cup fresh lemon juice",
            "Powdered sugar for dusting"
        ],
        instructions: [
            "Preheat oven to 350°F (175°C).",
            "Mix flour, powdered sugar, and cannabis butter to form crust.",
            "Press into baking pan and bake 15 minutes.",
            "Whisk eggs, sugar, flour, and lemon juice for filling.",
            "Pour over crust and bake 20 minutes.",
            "Cool and dust with powdered sugar.",
            "Cut into bars and serve."
        ],
        prepTime: "15 minutes",
        cookTime: "35 minutes",
        servings: 12,
        difficulty: "Intermediate",
        flavors: ["Sweet", "Citrus", "Tangy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Mango Salsa",
        description: "A fresh and zesty mango salsa with a subtle cannabis olive oil infusion, great for chips or grilled meats.",
        ingredients: [
            "2 ripe mangoes, diced",
            "1/2 red onion, finely chopped",
            "1 jalapeño, seeded and minced",
            "1/4 cup cannabis-infused olive oil",
            "1/4 cup fresh cilantro, chopped",
            "1 lime, juiced",
            "Salt to taste"
        ],
        instructions: [
            "Combine mango, onion, jalapeño, and cilantro in a bowl.",
            "Add cannabis olive oil and lime juice.",
            "Season with salt and mix well.",
            "Chill before serving."
        ],
        prepTime: "10 minutes",
        cookTime: "0 minutes",
        servings: 6,
        difficulty: "Easy",
        flavors: ["Fruity", "Spicy", "Fresh"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Peanut Butter Cookies",
        description: "Soft and chewy peanut butter cookies infused with cannabis butter for a classic treat with a twist.",
        ingredients: [
            "1 cup cannabis-infused butter, softened",
            "1 cup peanut butter",
            "1 cup sugar",
            "1 cup brown sugar",
            "2 large eggs",
            "2 1/2 cups all-purpose flour",
            "1 tsp baking soda",
            "1/2 tsp salt"
        ],
        instructions: [
            "Preheat oven to 350°F (175°C).",
            "Cream cannabis butter, peanut butter, and sugars.",
            "Add eggs one at a time.",
            "Mix flour, baking soda, and salt; gradually add.",
            "Drop spoonfuls on baking sheet.",
            "Flatten with fork and bake 10-12 minutes.",
            "Cool before serving."
        ],
        prepTime: "15 minutes",
        cookTime: "12 minutes",
        servings: 24,
        difficulty: "Intermediate",
        flavors: ["Sweet", "Nutty", "Buttery"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Tomato Basil Soup",
        description: "A comforting tomato soup with fresh basil and cannabis-infused olive oil for a soothing meal.",
        ingredients: [
            "2 tbsp cannabis-infused olive oil",
            "1 onion, chopped",
            "3 cloves garlic, minced",
            "4 cups tomatoes, chopped",
            "2 cups vegetable broth",
            "1/4 cup fresh basil, chopped",
            "Salt and pepper to taste",
            "1/2 cup cream (optional)"
        ],
        instructions: [
            "Heat cannabis olive oil in pot and sauté onion and garlic.",
            "Add tomatoes and broth; simmer 20 minutes.",
            "Blend soup until smooth.",
            "Stir in basil, salt, pepper, and cream if using.",
            "Heat through and serve."
        ],
        prepTime: "10 minutes",
        cookTime: "25 minutes",
        servings: 4,
        difficulty: "Easy",
        flavors: ["Savory", "Herbaceous", "Creamy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Blueberry Muffins",
        description: "Moist and fluffy blueberry muffins made with cannabis-infused butter for a delightful breakfast.",
        ingredients: [
            "2 cups all-purpose flour",
            "1/2 cup sugar",
            "2 tsp baking powder",
            "1/2 tsp salt",
            "1/2 cup cannabis-infused butter, melted",
            "1 cup milk",
            "2 large eggs",
            "1 1/2 cups fresh blueberries"
        ],
        instructions: [
            "Preheat oven to 375°F (190°C).",
            "Mix flour, sugar, baking powder, and salt.",
            "Whisk cannabis butter, milk, and eggs.",
            "Combine wet and dry ingredients; fold in blueberries.",
            "Fill muffin cups and bake 20-25 minutes.",
            "Cool before serving."
        ],
        prepTime: "15 minutes",
        cookTime: "25 minutes",
        servings: 12,
        difficulty: "Easy",
        flavors: ["Sweet", "Fruity", "Buttery"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Garlic Mashed Potatoes",
        description: "Creamy mashed potatoes with cannabis-infused butter and roasted garlic for a comforting side dish.",
        ingredients: [
            "3 lbs potatoes, peeled and chopped",
            "1/2 cup cannabis-infused butter",
            "4 cloves roasted garlic",
            "1/2 cup milk",
            "Salt and pepper to taste"
        ],
        instructions: [
            "Boil potatoes until tender, about 20 minutes.",
            "Drain and mash potatoes.",
            "Mix in cannabis butter, roasted garlic, and milk.",
            "Season with salt and pepper.",
            "Serve warm."
        ],
        prepTime: "10 minutes",
        cookTime: "20 minutes",
        servings: 6,
        difficulty: "Easy",
        flavors: ["Savory", "Garlic", "Creamy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Matcha Latte",
        description: "A creamy and energizing matcha latte with a subtle cannabis infusion for balance.",
        ingredients: [
            "1 tsp matcha powder",
            "1 tbsp hot water",
            "1 cup milk or milk alternative",
            "1 tsp cannabis tincture",
            "Honey or sweetener to taste"
        ],
        instructions: [
            "Whisk matcha powder with hot water until smooth.",
            "Heat milk and froth if desired.",
            "Combine matcha and milk.",
            "Stir in cannabis tincture and sweetener.",
            "Serve warm."
        ],
        prepTime: "5 minutes",
        cookTime: "5 minutes",
        servings: 1,
        difficulty: "Easy",
        flavors: ["Earthy", "Sweet", "Creamy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Sweet Potato Fries",
        description: "Crispy baked sweet potato fries tossed in cannabis-infused olive oil and spices.",
        ingredients: [
            "3 large sweet potatoes, cut into fries",
            "3 tbsp cannabis-infused olive oil",
            "1 tsp smoked paprika",
            "1/2 tsp garlic powder",
            "Salt and pepper to taste"
        ],
        instructions: [
            "Preheat oven to 425°F (220°C).",
            "Toss sweet potatoes with cannabis olive oil and spices.",
            "Spread on baking sheet in single layer.",
            "Bake 25-30 minutes, flipping halfway.",
            "Serve hot."
        ],
        prepTime: "10 minutes",
        cookTime: "30 minutes",
        servings: 4,
        difficulty: "Easy",
        flavors: ["Savory", "Smoky", "Spicy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Pumpkin Spice Latte",
        description: "A seasonal pumpkin spice latte with cannabis-infused cream for a cozy treat.",
        ingredients: [
            "1 cup strong brewed coffee",
            "1/2 cup milk",
            "2 tbsp pumpkin puree",
            "1 tbsp cannabis-infused cream",
            "1 tsp pumpkin pie spice",
            "2 tsp sugar"
        ],
        instructions: [
            "Heat milk, pumpkin puree, sugar, and pumpkin spice until hot.",
            "Froth mixture and add cannabis cream.",
            "Pour coffee into mug and top with pumpkin milk mixture.",
            "Serve immediately."
        ],
        prepTime: "5 minutes",
        cookTime: "5 minutes",
        servings: 1,
        difficulty: "Easy",
        flavors: ["Spicy", "Sweet", "Creamy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Caprese Salad",
        description: "Fresh mozzarella, tomatoes, and basil drizzled with cannabis-infused olive oil and balsamic glaze.",
        ingredients: [
            "2 cups cherry tomatoes, halved",
            "8 oz fresh mozzarella, sliced",
            "1/4 cup fresh basil leaves",
            "3 tbsp cannabis-infused olive oil",
            "2 tbsp balsamic glaze",
            "Salt and pepper to taste"
        ],
        instructions: [
            "Arrange tomatoes, mozzarella, and basil on a plate.",
            "Drizzle with cannabis olive oil and balsamic glaze.",
            "Season with salt and pepper.",
            "Serve immediately."
        ],
        prepTime: "10 minutes",
        cookTime: "0 minutes",
        servings: 4,
        difficulty: "Easy",
        flavors: ["Fresh", "Savory", "Herbaceous"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Chocolate Chip Pancakes",
        description: "Fluffy pancakes loaded with chocolate chips and cannabis-infused butter for a delicious breakfast.",
        ingredients: [
            "1 1/2 cups all-purpose flour",
            "3 1/2 tsp baking powder",
            "1 tsp salt",
            "1 tbsp sugar",
            "1 1/4 cups milk",
            "1 large egg",
            "3 tbsp cannabis-infused butter, melted",
            "1/2 cup chocolate chips"
        ],
        instructions: [
            "Mix flour, baking powder, salt, and sugar.",
            "Whisk milk, egg, and cannabis butter.",
            "Combine wet and dry ingredients; fold in chocolate chips.",
            "Cook on griddle until bubbles form; flip and cook until golden.",
            "Serve warm with syrup."
        ],
        prepTime: "10 minutes",
        cookTime: "15 minutes",
        servings: 4,
        difficulty: "Easy",
        flavors: ["Sweet", "Chocolatey", "Buttery"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Avocado Toast",
        description: "Toasted bread topped with smashed avocado and a drizzle of cannabis-infused olive oil.",
        ingredients: [
            "2 slices whole grain bread",
            "1 ripe avocado",
            "1 tbsp cannabis-infused olive oil",
            "Salt and pepper to taste",
            "Red pepper flakes (optional)"
        ],
        instructions: [
            "Toast bread slices.",
            "Mash avocado and season with salt and pepper.",
            "Spread avocado on toast.",
            "Drizzle cannabis olive oil on top.",
            "Sprinkle red pepper flakes if desired.",
            "Serve immediately."
        ],
        prepTime: "5 minutes",
        cookTime: "5 minutes",
        servings: 1,
        difficulty: "Easy",
        flavors: ["Savory", "Creamy", "Spicy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Caramel Sauce",
        description: "Rich and buttery caramel sauce infused with cannabis butter, perfect for drizzling over desserts.",
        ingredients: [
            "1 cup sugar",
            "6 tbsp cannabis-infused butter",
            "1/2 cup heavy cream",
            "1 tsp vanilla extract",
            "Pinch of salt"
        ],
        instructions: [
            "Heat sugar over medium heat until melted and amber-colored.",
            "Add cannabis butter and stir until melted.",
            "Slowly add heavy cream while stirring.",
            "Remove from heat and stir in vanilla and salt.",
            "Cool before using."
        ],
        prepTime: "10 minutes",
        cookTime: "10 minutes",
        servings: 12,
        difficulty: "Intermediate",
        flavors: ["Sweet", "Buttery", "Rich"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Veggie Stir Fry",
        description: "A colorful mix of vegetables stir-fried with cannabis-infused sesame oil for a healthy and flavorful meal.",
        ingredients: [
            "2 tbsp cannabis-infused sesame oil",
            "1 red bell pepper, sliced",
            "1 cup broccoli florets",
            "1 cup snap peas",
            "1 carrot, julienned",
            "2 cloves garlic, minced",
            "2 tbsp soy sauce",
            "1 tsp grated ginger"
        ],
        instructions: [
            "Heat cannabis sesame oil in wok over high heat.",
            "Add garlic and ginger, stir 30 seconds.",
            "Add vegetables and stir fry 5-7 minutes.",
            "Add soy sauce and toss to coat.",
            "Serve hot over rice or noodles."
        ],
        prepTime: "10 minutes",
        cookTime: "10 minutes",
        servings: 4,
        difficulty: "Easy",
        flavors: ["Savory", "Umami", "Garlicky"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Banana Bread",
        description: "Moist and flavorful banana bread made with cannabis-infused butter for a relaxing snack.",
        ingredients: [
            "1/2 cup cannabis-infused butter, softened",
            "1 cup sugar",
            "2 eggs",
            "3 ripe bananas, mashed",
            "1 1/2 cups all-purpose flour",
            "1 tsp baking soda",
            "1/2 tsp salt",
            "1 tsp vanilla extract"
        ],
        instructions: [
            "Preheat oven to 350°F (175°C).",
            "Cream cannabis butter and sugar.",
            "Add eggs and vanilla, mix well.",
            "Stir in mashed bananas.",
            "Combine flour, baking soda, and salt; add to wet mixture.",
            "Pour into greased loaf pan.",
            "Bake 60 minutes or until toothpick comes out clean.",
            "Cool before slicing."
        ],
        prepTime: "15 minutes",
        cookTime: "60 minutes",
        servings: 8,
        difficulty: "Intermediate",
        flavors: ["Sweet", "Fruity", "Buttery"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Hummus",
        description: "Creamy and smooth hummus blended with cannabis-infused olive oil for a tasty dip.",
        ingredients: [
            "1 can chickpeas, drained",
            "1/4 cup cannabis-infused olive oil",
            "2 tbsp tahini",
            "2 cloves garlic",
            "1 lemon, juiced",
            "Salt to taste",
            "Paprika for garnish"
        ],
        instructions: [
            "Combine chickpeas, cannabis olive oil, tahini, garlic, and lemon juice in food processor.",
            "Blend until smooth.",
            "Season with salt.",
            "Garnish with paprika.",
            "Serve with pita or veggies."
        ],
        prepTime: "10 minutes",
        cookTime: "0 minutes",
        servings: 6,
        difficulty: "Easy",
        flavors: ["Savory", "Tangy", "Garlicky"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Coconut Curry",
        description: "A fragrant vegetable curry simmered in coconut milk with cannabis-infused oil for a warming meal.",
        ingredients: [
            "2 tbsp cannabis-infused coconut oil",
            "1 onion, chopped",
            "3 cloves garlic, minced",
            "1 tbsp ginger, grated",
            "2 tbsp curry powder",
            "1 can coconut milk",
            "2 cups mixed vegetables",
            "Salt to taste",
            "Fresh cilantro for garnish"
        ],
        instructions: [
            "Heat cannabis coconut oil in pot.",
            "Sauté onion, garlic, and ginger until fragrant.",
            "Add curry powder and stir 1 minute.",
            "Add vegetables and coconut milk.",
            "Simmer 20 minutes until vegetables are tender.",
            "Season with salt.",
            "Garnish with cilantro and serve with rice."
        ],
        prepTime: "15 minutes",
        cookTime: "25 minutes",
        servings: 4,
        difficulty: "Intermediate",
        flavors: ["Savory", "Spicy", "Creamy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Chocolate Truffles",
        description: "Decadent chocolate truffles made with cannabis-infused cream for an elegant dessert.",
        ingredients: [
            "8 oz dark chocolate, chopped",
            "1/2 cup heavy cream",
            "2 tbsp cannabis-infused butter",
            "Cocoa powder for dusting"
        ],
        instructions: [
            "Heat cream and cannabis butter until simmering.",
            "Pour over chopped chocolate and let sit 5 minutes.",
            "Stir until smooth ganache forms.",
            "Chill ganache until firm.",
            "Scoop and roll into balls.",
            "Dust with cocoa powder.",
            "Refrigerate until serving."
        ],
        prepTime: "20 minutes",
        cookTime: "5 minutes",
        servings: 20,
        difficulty: "Advanced",
        flavors: ["Chocolatey", "Rich", "Buttery"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Iced Mint Tea",
        description: "Refreshing iced tea infused with fresh mint leaves and cannabis tincture for a cooling beverage.",
        ingredients: [
            "4 cups brewed black tea, cooled",
            "1/4 cup fresh mint leaves",
            "1 tbsp cannabis tincture",
            "2 tbsp honey",
            "Ice cubes"
        ],
        instructions: [
            "Steep mint leaves in brewed tea until fragrant.",
            "Remove mint and stir in honey and cannabis tincture.",
            "Serve over ice."
        ],
        prepTime: "5 minutes",
        cookTime: "10 minutes",
        servings: 4,
        difficulty: "Easy",
        flavors: ["Minty", "Sweet", "Refreshing"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Mac and Cheese",
        description: "Creamy and cheesy macaroni baked with cannabis-infused butter for a comforting meal.",
        ingredients: [
            "8 oz elbow macaroni",
            "3 tbsp cannabis-infused butter",
            "3 tbsp flour",
            "2 cups milk",
            "2 cups shredded cheddar cheese",
            "Salt and pepper to taste",
            "1/2 cup breadcrumbs"
        ],
        instructions: [
            "Cook macaroni according to package; drain.",
            "Melt cannabis butter and whisk in flour to make roux.",
            "Gradually add milk, cook until thickened.",
            "Stir in cheese until melted.",
            "Combine cheese sauce with pasta.",
            "Pour into baking dish, top with breadcrumbs.",
            "Bake at 350°F (175°C) for 20 minutes.",
            "Serve warm."
        ],
        prepTime: "15 minutes",
        cookTime: "30 minutes",
        servings: 6,
        difficulty: "Intermediate",
        flavors: ["Cheesy", "Savory", "Buttery"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Berry Parfait",
        description: "Layers of fresh berries, cannabis-infused yogurt, and granola for a healthy and tasty snack.",
        ingredients: [
            "1 cup mixed berries",
            "1 cup plain yogurt",
            "1 tbsp cannabis tincture",
            "1/2 cup granola",
            "Honey to taste"
        ],
        instructions: [
            "Mix yogurt with cannabis tincture and honey.",
            "Layer berries, cannabis yogurt, and granola in glass.",
            "Repeat layers and top with berries.",
            "Serve chilled."
        ],
        prepTime: "10 minutes",
        cookTime: "0 minutes",
        servings: 2,
        difficulty: "Easy",
        flavors: ["Sweet", "Fruity", "Creamy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Beef Chili",
        description: "Hearty and spicy beef chili simmered with cannabis-infused olive oil for a warming meal.",
        ingredients: [
            "1 lb ground beef",
            "2 tbsp cannabis-infused olive oil",
            "1 onion, chopped",
            "3 cloves garlic, minced",
            "1 can kidney beans",
            "1 can diced tomatoes",
            "2 tbsp chili powder",
            "1 tsp cumin",
            "Salt and pepper to taste"
        ],
        instructions: [
            "Heat cannabis olive oil in pot.",
            "Cook beef until browned; remove excess fat.",
            "Add onion and garlic; sauté until soft.",
            "Add beans, tomatoes, chili powder, cumin, salt, and pepper.",
            "Simmer 30 minutes.",
            "Serve hot with toppings."
        ],
        prepTime: "15 minutes",
        cookTime: "45 minutes",
        servings: 6,
        difficulty: "Intermediate",
        flavors: ["Spicy", "Savory", "Hearty"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Lemon Garlic Shrimp",
        description: "Succulent shrimp sautéed in cannabis-infused butter with lemon and garlic for a quick dinner.",
        ingredients: [
            "1 lb shrimp, peeled and deveined",
            "3 tbsp cannabis-infused butter",
            "4 cloves garlic, minced",
            "1 lemon, juiced",
            "Salt and pepper to taste",
            "Fresh parsley for garnish"
        ],
        instructions: [
            "Melt cannabis butter in skillet over medium heat.",
            "Add garlic and cook until fragrant.",
            "Add shrimp, cook 2-3 minutes per side.",
            "Stir in lemon juice, salt, and pepper.",
            "Garnish with parsley and serve."
        ],
        prepTime: "10 minutes",
        cookTime: "10 minutes",
        servings: 4,
        difficulty: "Easy",
        flavors: ["Savory", "Citrus", "Garlic"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Oatmeal Cookies",
        description: "Chewy oatmeal cookies with cannabis-infused butter and raisins for a wholesome snack.",
        ingredients: [
            "1 cup cannabis-infused butter, softened",
            "1 cup brown sugar",
            "1/2 cup white sugar",
            "2 eggs",
            "1 1/2 cups all-purpose flour",
            "1 tsp baking soda",
            "1 tsp cinnamon",
            "3 cups oats",
            "1 cup raisins"
        ],
        instructions: [
            "Preheat oven to 350°F (175°C).",
            "Cream cannabis butter and sugars.",
            "Add eggs and mix.",
            "Combine flour, baking soda, and cinnamon; add to wet ingredients.",
            "Stir in oats and raisins.",
            "Drop spoonfuls on baking sheet.",
            "Bake 10-12 minutes.",
            "Cool before serving."
        ],
        prepTime: "15 minutes",
        cookTime: "12 minutes",
        servings: 24,
        difficulty: "Intermediate",
        flavors: ["Sweet", "Chewy", "Spiced"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Caesar Salad Dressing",
        description: "Classic Caesar dressing with a cannabis-infused olive oil twist for a flavorful salad.",
        ingredients: [
            "1/2 cup cannabis-infused olive oil",
            "2 cloves garlic, minced",
            "2 anchovy fillets, minced",
            "1 tbsp Dijon mustard",
            "2 tbsp lemon juice",
            "1/4 cup grated Parmesan cheese",
            "Salt and pepper to taste"
        ],
        instructions: [
            "Whisk garlic, anchovies, mustard, and lemon juice.",
            "Slowly whisk in cannabis olive oil.",
            "Stir in Parmesan.",
            "Season with salt and pepper.",
            "Use immediately or refrigerate."
        ],
        prepTime: "10 minutes",
        cookTime: "0 minutes",
        servings: 6,
        difficulty: "Easy",
        flavors: ["Savory", "Tangy", "Umami"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Chocolate Milkshake",
        description: "Creamy chocolate milkshake blended with cannabis-infused ice cream for a decadent treat.",
        ingredients: [
            "2 cups cannabis-infused vanilla ice cream",
            "1 cup milk",
            "1/4 cup chocolate syrup",
            "Whipped cream for topping"
        ],
        instructions: [
            "Blend ice cream, milk, and chocolate syrup until smooth.",
            "Pour into glass.",
            "Top with whipped cream and serve."
        ],
        prepTime: "5 minutes",
        cookTime: "0 minutes",
        servings: 2,
        difficulty: "Easy",
        flavors: ["Chocolatey", "Sweet", "Creamy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Roasted Vegetables",
        description: "A medley of seasonal vegetables roasted with cannabis-infused olive oil and herbs.",
        ingredients: [
            "2 cups carrots, chopped",
            "2 cups zucchini, sliced",
            "1 red onion, chopped",
            "3 tbsp cannabis-infused olive oil",
            "1 tsp dried rosemary",
            "Salt and pepper to taste"
        ],
        instructions: [
            "Preheat oven to 400°F (200°C).",
            "Toss vegetables with cannabis olive oil, rosemary, salt, and pepper.",
            "Spread on baking sheet.",
            "Roast 25-30 minutes until tender.",
            "Serve warm."
        ],
        prepTime: "10 minutes",
        cookTime: "30 minutes",
        servings: 4,
        difficulty: "Easy",
        flavors: ["Savory", "Herbaceous", "Earthy"]
    ),
    CannabisRecipe(
        id: UUID(),
        title: "Cannabis-Infused Chai Latte",
        description: "Spiced chai tea combined with steamed milk and cannabis-infused honey for a warm and comforting drink.",
        ingredients: [
            "1 chai tea bag",
            "1 cup water",
            "1 cup milk",
            "1 tbsp cannabis-infused honey",
            "1/2 tsp cinnamon",
            "1/4 tsp ground ginger"
        ],
        instructions: [
            "Brew chai tea in hot water for 5 minutes.",
            "Heat milk with cinnamon and ginger.",
            "Froth milk and combine with tea.",
            "Stir in cannabis honey.",
            "Serve warm."
        ],
        prepTime: "5 minutes",
        cookTime: "5 minutes",
        servings: 1,
        difficulty: "Easy",
        flavors: ["Spicy", "Sweet", "Creamy"]
    )
]
