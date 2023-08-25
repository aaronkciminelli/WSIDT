import SwiftUI

struct FusionGeneratorView: View {
    @State private var character1: String = ""
    @State private var character2: String = ""
    @State private var selectedCategory: String = "Cartoon"
    @State private var isDarkMode: Bool = false
    
    // New variables for animation and timer
    @State private var isAnimating1: Bool = false
    @State private var isAnimating2: Bool = false
    @State private var timer1: Timer? = nil
    @State private var timer2: Timer? = nil
    
    var categories: [String] = [
        "Cartoon", "TV Shows", "Historical Person",
        "Cartoon + TV Shows", "Cartoon + Historical Person", "TV Show + Historical Person"
    ]
    
    var body: some View {
        ZStack {
            (isDarkMode ? Color.black : Color.white)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                
                Picker("Select Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                HStack {
                    TextField("Enter Character 1 or tap generate", text: $character1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(isDarkMode ? Color.black : Color.black)
                    if isAnimating1 {
                        Button("Stop") {
                            toggleGenerateStop(characterNumber: 1)
                        }
                        .buttonStyle(RedButtonStyle())
                    } else {
                        Button("Generate") {
                            toggleGenerateStop(characterNumber: 1)
                        }
                        .buttonStyle(FilledButtonStyle())
                    }
                }

                HStack {
                    TextField("Enter Character 2 or tap generate", text: $character2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(isDarkMode ? Color.black : Color.black)
                    if isAnimating2 {
                        Button("Stop") {
                            toggleGenerateStop(characterNumber: 2)
                        }
                        .buttonStyle(RedButtonStyle())
                    } else {
                        Button("Generate") {
                            toggleGenerateStop(characterNumber: 2)
                        }
                        .buttonStyle(FilledButtonStyle())
                    }
                }
                
                HStack {
                    Text(character1)
                        .fontWeight(.bold)
                    Text("fused with")
                    Text(character2)
                        .fontWeight(.bold)
                }
                .font(.title3)  // Sets the font size for all the Text elements in the HStack

                Button("Clear") {
                    character1 = ""
                    character2 = ""
                }
                .buttonStyle(RedButtonStyle())
                .padding(.top, 20)
            }
            .padding()
            .foregroundColor(isDarkMode ? Color.white : Color.black)
            .navigationBarTitle("Fusion Generator", displayMode: .inline)
            
            VStack {
                HStack {
                    Button(action: {
                    }) {
                        Image(systemName: "house.fill")
                            .font(.title2)
                            .padding(.leading)
                    }
                    
                    Spacer()
                    
                    Toggle(isOn: $isDarkMode) {
                        Text(isDarkMode ? "Dark Mode" : "Light Mode")
                    }
                    .padding(.trailing)
                }
                .padding(.bottom, 10)
                
                Spacer()
            }
        }
    }
    
    private func toggleGenerateStop(characterNumber: Int) {
        if characterNumber == 1 {
            if isAnimating1 {
                timer1?.invalidate()
            } else {
                timer1 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    character1 = generateCharacter(for: selectedCategory, characterNumber: 1)
                }
            }
            isAnimating1.toggle()
        } else {
            if isAnimating2 {
                timer2?.invalidate()
            } else {
                timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    character2 = generateCharacter(for: selectedCategory, characterNumber: 2)
                }
            }
            isAnimating2.toggle()
        }
    }
    
    func generateCharacter(for category: String, characterNumber: Int) -> String {
        switch category {
        case "Cartoon":
            return CharacterData.cartoonCharacters.randomElement() ?? ""
        case "TV Shows":
            return CharacterData.tvShowCharacters.randomElement() ?? ""
        case "Historical Person":
            return CharacterData.historicalPersons.randomElement() ?? ""
        case "Cartoon + TV Shows":
            return characterNumber == 1 ? CharacterData.cartoonCharacters.randomElement() ?? "" : CharacterData.tvShowCharacters.randomElement() ?? ""
        case "Cartoon + Historical Person":
            return characterNumber == 1 ? CharacterData.cartoonCharacters.randomElement() ?? "" : CharacterData.historicalPersons.randomElement() ?? ""
        case "TV Show + Historical Person":
            return characterNumber == 1 ? CharacterData.tvShowCharacters.randomElement() ?? "" : CharacterData.historicalPersons.randomElement() ?? ""
        default:
            return ""
        }
    }
}

struct FusionGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        FusionGeneratorView()
    }
}
