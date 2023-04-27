////
////  DietingPlanView.swift
////  BMI Calc
////
////  Created by James Toh on 27/4/23.
////
import SwiftUI

struct HealthyMealsView: View {
    
    let recipes = [
        recipe(name: "Chicken", ingridients: ["Chimken", "food"], steps: ["put chimken into food", "light food on fire"]),
        recipe(name: "Salad", ingridients: ["lettuce", "tomatoes", "cucumbers"], steps: ["wash vegetables", "cut vegetables", "mix vegetables"]),
        recipe(name: "Soup", ingridients: ["broth", "vegetables"], steps: ["cook vegetables in broth", "add spices", "serve hot"]),
        recipe(name: "Pasta", ingridients: ["pasta", "sauce"], steps: ["boil pasta", "heat sauce", "combine and serve"]),
        recipe(name: "Salad", ingridients: ["lettuce", "tomatoes", "dressing"], steps: ["chop lettuce and tomatoes", "toss with dressing", "serve cold"]),
        recipe(name: "Grilled Salmon", ingridients: ["salmon fillet", "olive oil", "lemon", "salt", "pepper"], steps: ["preheat grill to medium-high heat", "brush salmon with olive oil and sprinkle with salt and pepper", "grill salmon for 5-7 minutes per side, or until cooked through", "squeeze lemon over salmon before serving"]),
        recipe(name: "Stir Fry", ingridients: ["chicken breast", "rice", "vegetables", "soy sauce", "corn starch", "oil"], steps: ["cook rice according to package instructions", "cut chicken into bite-sized pieces and stir-fry in a large skillet with oil", "add chopped vegetables and stir-fry until crisp-tender", "combine soy sauce and corn starch and add to skillet", "cook until sauce thickens and serve over rice"]),
        recipe(name: "Smoothie Bowl", ingridients: ["frozen berries", "banana", "yogurt", "milk", "granola", "honey"], steps: ["blend berries, banana, yogurt, and milk in a blender until smooth", "pour into a bowl and top with granola and honey"]),
        recipe(name: "Avocado Toast", ingridients: ["bread", "avocado", "salt", "pepper", "lemon juice"], steps: ["toast bread until golden brown", "smash avocado onto toast and sprinkle with salt, pepper, and lemon juice"]),
        recipe(name: "Chicken Caesar Salad", ingridients: ["chicken breast", "lettuce", "croutons", "parmesan cheese", "caesar dressing"], steps: ["season chicken breast with salt and pepper and grill until cooked through", "chop lettuce and place in a large bowl", "add croutons and parmesan cheese to bowl", "slice chicken and add to bowl", "drizzle caesar dressing over salad and toss to combine"]),
        recipe(name: "Roasted Vegetables", ingridients: ["assorted vegetables", "olive oil", "salt", "pepper", "garlic powder"], steps: ["preheat oven to 425°F", "chop vegetables into bite-sized pieces and spread onto a baking sheet", "drizzle with olive oil and sprinkle with salt, pepper, and garlic powder", "roast in the oven for 20-25 minutes, or until vegetables are tender and caramelized"]),
        recipe(name: "Veggie Burger", ingridients: ["veggie patty", "burger bun", "lettuce", "tomato", "onion", "ketchup", "mustard"], steps: ["cook veggie patty according to package instructions", "toast burger bun", "assemble burger with lettuce, tomato, and onion", "add ketchup and mustard to taste"]),
        recipe(name: "Banana Pancakes", ingridients: ["flour", "baking powder", "salt", "milk", "egg", "banana", "vanilla extract"], steps: ["mix flour, baking powder, and salt in a bowl", "in a separate bowl, whisk together milk, egg, mashed banana, and vanilla extract", "add wet ingredients to dry ingredients and mix until just combined", "heat a nonstick skillet over medium heat and pour pancake batter onto skillet", "cook until bubbles form on the surface of the pancake, then flip and cook until golden brown"])
    ]
    
    @State private var currentView = ""
    @State private var currentRecipe = recipe(name: "Chicken", ingridients: ["Chimken", "food"], steps: ["put chimken into food", "light food on fire"])
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes, id: \.name) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        Text(recipe.name)
                    }
                }
            }
            .navigationTitle("Healthy Recipes")
        }
    }
}

struct recipe {
    var name: String
    var ingridients: [String]
    var steps: [String]
}


struct RecipeView: View {
    
    let recipe: recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(recipe.name)
                .font(.largeTitle)
                .bold()
            
            Text("Ingredients:")
                .font(.headline)
            ForEach(recipe.ingridients, id: \.self) { ingredient in
                Text("- \(ingredient)")
            }
            
            Text("Steps:")
                .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
                .font(.headline)
            ForEach(recipe.steps, id: \.self) { step in
                Text("\(recipe.steps.firstIndex(of: step)! + 1). \(step)")
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct DietingPlanView_Previews: PreviewProvider {
    static var previews: some View {
        HealthyMealsView()
    }
}
