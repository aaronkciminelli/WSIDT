//
//  WordCategory.swift
//  wsdttest
//
//  Created by Aaron Ciminelli on 8/23/23.
//

import Foundation

struct WordCategory {
    let id: String
    let definition: String
    let generateInput: [String]
}

let wordCategories: [WordCategory] = [
    WordCategory(id: "Abstract Concept", definition: "An idea that people can understand that has no physical form.", generateInput: ["Freedom", "Love", "Justice", "Knowledge", "Truth"]),
    WordCategory(id: "Action", definition: "What is the character doing?", generateInput: ["Running", "Jumping", "Swimming", "Laughing", "Reading"]),
    WordCategory(id: "Adjective", definition: "A word that describes or modifies a noun.", generateInput: ["Beautiful", "Large", "Shiny", "Ancient", "Smooth"]),
    WordCategory(id: "Animal", definition: "A living organism characterized by voluntary movement.", generateInput: ["Lion", "Elephant", "Dolphin", "Eagle", "Rabbit"]),
    WordCategory(id: "Art Movement", definition: "A tendency or style in art with a specific common philosophy or goal.", generateInput: ["Renaissance", "Impressionism", "Cubism", "Surrealism", "Abstract Expressionism"]),
    WordCategory(id: "Artist", definition: "A person who produces paintings, drawings, or other artistic works.", generateInput: ["Leonardo da Vinci", "Vincent van Gogh", "Pablo Picasso", "Frida Kahlo", "Michelangelo"]),
    WordCategory(id: "Art Style", definition: "A distinctive manner or method of artistic expression.", generateInput: ["Baroque", "Pop Art", "Art Nouveau", "Gothic", "Neoclassical"]),
    WordCategory(id: "Body Part", definition: "Any part of an organism such as an organ or extremity.", generateInput: ["Hand", "Heart", "Eye", "Leg", "Brain"]),
    WordCategory(id: "Character", definition: "A person in a novel, play, or movie.", generateInput: ["Harry Potter", "Sherlock Holmes", "Elizabeth Bennet", "Jay Gatsby", "Hannibal Lecter"]),
    WordCategory(id: "City", definition: "A large and permanent human settlement.", generateInput: ["New York", "Paris", "Tokyo", "London", "Sydney"]),
    WordCategory(id: "Color", definition: "A property of light as seen by people.", generateInput: ["Red", "Blue", "Yellow", "Green", "Purple"]),
    WordCategory(id: "Country", definition: "A nation with its own government and borders.", generateInput: ["United States", "India", "Brazil", "Canada", "Germany"]),
    WordCategory(id: "Decade", definition: "A period of ten years.", generateInput: ["1980s", "1990s", "2000s", "2010s", "2020s"]),
    WordCategory(id: "Artifact", definition: "An object made by a human being, typically an item of cultural or historical interest.", generateInput: ["Rosetta Stone", "The Mona Lisa", "Terracotta Army", "Stonehenge", "Sarcophagus of Tutankhamun"]),
    WordCategory(id: "Emotion", definition: "A strong feeling deriving from one's circumstances, mood, or relationships with others.", generateInput: ["Happiness", "Sadness", "Anger", "Fear", "Surprise"]),
    WordCategory(id: "Furniture", definition: "Objects that can be moved and used to make a room suitable for living or working.", generateInput: ["Chair", "Table", "Bed", "Wardrobe", "Desk"]),
    WordCategory(id: "Historical period", definition: "A period of time in history.", generateInput: ["Renaissance", "Industrial Revolution", "Victorian Era", "Ancient Egypt", "Middle Ages"]),
    WordCategory(id: "Idea", definition: "A thought or suggestion as to a possible course of action.", generateInput: ["Democracy", "Evolution", "Quantum Mechanics", "Relativity", "Sustainability"]),
    WordCategory(id: "Instrument", definition: "A device created to make musical sounds.", generateInput: ["Piano", "Guitar", "Violin", "Drum", "Flute"]),
    WordCategory(id: "Job", definition: "A paid position of regular employment.", generateInput: ["Teacher", "Accountant", "Nurse", "Architect", "Chef"]),
    WordCategory(id: "Landscape", definition: "All the visible features of an area of land.", generateInput: ["Mountains", "Desert", "Forest", "Beach", "Plains"]),
    WordCategory(id: "Material", definition: "The physical substance that the character or object is made of.", generateInput: ["Wood", "Metal", "Glass", "Plastic", "Cloth"]),
    WordCategory(id: "Mythical Creature", definition: "A creature from myths or folklore.", generateInput: ["Dragon", "Unicorn", "Phoenix", "Minotaur", "Mermaid"]),
    WordCategory(id: "Noun", definition: "A person, place, or thing.", generateInput: ["Dog", "Mountain", "River", "Computer", "Book"]),
    WordCategory(id: "Number", definition: "A mathematical value or a word representing a quantity.", generateInput: ["One", "Ten", "Hundred", "Thousand", "Million"]),
    WordCategory(id: "Plant", definition: "A living organism that grows in the ground, usually producing oxygen through photosynthesis.", generateInput: ["Rose", "Oak Tree", "Cactus", "Fern", "Lily"]),
    WordCategory(id: "Profession", definition: "A paid occupation, especially one that involves prolonged training and a formal qualification.", generateInput: ["Doctor", "Engineer", "Artist", "Lawyer", "Astronaut"]),
    WordCategory(id: "Setting", definition: "The place or type of surroundings where something is positioned or where an event takes place.", generateInput: ["Beach", "Forest", "Cityscape", "Desert", "Countryside"]),
    WordCategory(id: "Sport", definition: "An activity involving physical exertion and skill.", generateInput: ["Soccer", "Basketball", "Tennis", "Swimming", "Baseball"]),
    WordCategory(id: "Technology", definition: "Application of scientific knowledge for practical purposes.", generateInput: ["Smartphone", "Goblin goo", "Blockchain", "Virtual Reality", "Robotics"]),
    WordCategory(id: "Theme", definition: "The subject or topic of a work of art.", generateInput: ["Love", "Betrayal", "Nature", "Adventure", "Friendship"]),
    WordCategory(id: "Transport", definition: "A means of conveyance or travel from one place to another.", generateInput: ["Car", "Bicycle", "Airplane", "Train", "Boat"]),
    WordCategory(id: "Verb", definition: "A word used to describe an action or occurrence.", generateInput: ["Run", "Speak", "Jump", "Think", "Eat"]),
    WordCategory(id: "Weather", definition: "The state of the atmosphere at a particular place and time.", generateInput: ["Sunny", "Rainy", "Cloudy", "Snowy", "Windy"]),
    WordCategory(id: "Zodiac Sign", definition: "One of the twelve astrological signs each person is categorized under according to their birthdate.", generateInput: ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]),
]
