//
//  GeneratorView.swift
//  wsdttest
//
//  Created by Aaron Ciminelli on 8/23/23.
//

import SwiftUI

struct GeneratorView: View {
    // State variables to manage the current prompt and user inputs
    @State private var currentPromptIndex: Int = 0
    @State private var currentPrompt: String = prompts[0]
    @State private var completedPrompt: String = prompts[0]
    @State private var userInput: [String: String] = [:]
    @State private var isDarkMode: Bool = false  // Toggle state for light/dark mode
    
    // New variables for animation and timer
    @State private var isAnimating: Bool = false
    @State private var timer: Timer? = nil

    // Function to generate words for all categories present in the current prompt
    func generateAllWords() {
        for category in wordCategories {
            if completedPrompt.contains("[\(category.id)]") {
                if (self.userInput[category.id] == nil || self.userInput[category.id]!.isEmpty) {
                    let randomWord = category.generateInput.randomElement() ?? ""
                    self.userInput[category.id] = randomWord
                }
            }
        }
        updatePrompt()
    }

    func updatePrompt() {
        var tempPrompt = currentPrompt
        for (key, value) in userInput {
            tempPrompt = tempPrompt.replacingOccurrences(of: "[\(key)]", with: value)
        }
        completedPrompt = tempPrompt
    }

    // Computed variable to get definitions of categories present in the current prompt
    var currentDefinitions: [(String, String)] {
        var definitions: [(String, String)] = []
        for category in wordCategories {
            if currentPrompt.contains("[\(category.id)]") {
                definitions.append((category.id, category.definition))
            }
        }
        return definitions
    }

    // Function to extract category IDs from the current prompt
    func extractCategoriesFromPrompt() -> [String] {
        let regex = try! NSRegularExpression(pattern: "\\[(.*?)\\]")
        let nsString = currentPrompt as NSString
        let results = regex.matches(in: currentPrompt, range: NSRange(currentPrompt.startIndex..., in: currentPrompt))
        return results.map { nsString.substring(with: $0.range(at: 1)) }
    }

    // Abstracted TextField creation
    func InputField(for category: WordCategory) -> some View {
        HStack {
            TextField("Enter a \(category.id)", text: Binding(
                get: { self.userInput[category.id] ?? "" },
                set: {
                    self.userInput[category.id] = $0
                    self.updatePrompt()
                }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.trailing, 10)

            Button(action: {
                handleWordGeneration(for: category)
            }) {
                Text("Generate \(category.id)")
                    .styledButton(color: .blue)
            }
        }
    }

    // Combined function to generate words and update the prompt
    func handleWordGeneration(for category: WordCategory) {
        if let randomWord = category.generateInput.randomElement() {
            userInput[category.id] = randomWord
        }
        updatePrompt()
    }
    
    
    // New function to toggle Generate/Stop
    private func toggleGenerateStop() {
        if isAnimating {
            timer?.invalidate()
            timer = nil
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                let randomIndex = Int.random(in: 0..<prompts.count)
                currentPrompt = prompts[randomIndex]
                completedPrompt = currentPrompt  // Update completedPrompt to show the changes
            }
        }
        isAnimating.toggle()
    }

    // Main body of the view
    var body: some View {
        
        ZStack {
           
            // The main scrollable content
            ScrollView {
                VStack(spacing: 15) {
                    Spacer()
                    // Title and instructions
                    VStack {
                        Text("MadLibs Generator")
                            .font(.title)
                            .bold()
                        (Text("Instructions:").bold() + Text(" Fill in the blanks using the provided categories or generate random inputs."))
                            .padding(.top, 5)
                            .font(.caption)
                    }
                    .padding(.top, 30)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.bottom, 15)

                    // Display the current prompt (with input or placeholders)
                    Text(completedPrompt)
                        .font(.headline)
                        .padding()
                        .lineLimit(nil)

                    // Display input fields for each category in the current prompt
                    ForEach(extractCategoriesFromPrompt(), id: \.self) { categoryId in
                        if let category = wordCategories.first(where: { $0.id == categoryId }) {
                            InputField(for: category)
                        }
                    }

                    // Display definitions for the categories in the current prompt
                    VStack {
                        ForEach(currentDefinitions, id: \.0) { word, definition in
                            (Text(word).bold() + Text(": \(definition)"))
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.bottom, 5)
                        }
                    }

                    // Buttons to clear inputs, load a new prompt, or generate all words
                    HStack(spacing: 15) {
                        Button(action: {
                            userInput = [:]
                            completedPrompt = currentPrompt
                        }) {
                            Text("Clear All")
                                .styledButton(color: .red)
                        }

                        Button(action: {
                            currentPromptIndex = (currentPromptIndex + 1) % prompts.count
                            currentPrompt = prompts[currentPromptIndex]
                            completedPrompt = currentPrompt
                            userInput = [:]
                        }) {
                            Text("New Prompt")
                                .styledButton(color: .amber)
                        }

                        Button(action: {
                            generateAllWords()
                        }) {
                            Text("Generate All")
                                .styledButton(color: .green)
                        }
                    }
                    .padding(.top, 15)
                }
                .padding()
                .preferredColorScheme(isDarkMode ? .dark : .light)
            }

            // Fixed overlay at the top
            VStack {
                
                HStack {
                
                    Text(isDarkMode ? "Dark Mode" : "Light Mode")
                    Spacer() // Add spacer to push switch to the right
                    Toggle(isOn: $isDarkMode) {
                        EmptyView()
                    }
                    
                    .padding(.trailing)
                }
                .background(Color(.systemBackground))  // Adjust color as needed
                .shadow(radius: 10)  // Optional shadow for better visibility
                Spacer()  // Pushes the HStack to the top
            }


        }
    }
}

// Modifier to style buttons with a specific color
struct StyledButtonModifier: ViewModifier {
    var color: Color

    func body(content: Content) -> some View {
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
            .shadow(radius: 1)
    }
}

// Extension to define the amber color
extension Color {
    static let amber = Color(red: 1.0, green: 0.75, blue: 0.0)
}

// Extension to apply the button styling
extension View {
    func styledButton(color: Color) -> some View {
        self.modifier(StyledButtonModifier(color: color))
    }
}

// Preview for the GeneratorView
struct GeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorView()

    }
}

#Preview {
    GeneratorView()
}

