# WSIDT
What Should I Draw Today iOS application
Welcome to the WSIDT Readme

## Table of Contents
1. [Introduction](#introduction)
2. [Features](#features)
   - [Fusion Generator](#fusion-generator)
   - [Mad Lib Style Art Generator](#mad-lib-style-art-generator)
3. [Getting Started](#getting-started)
4. [File Structure](#file-structure)
5. [How to Contribute](#how-to-contribute)
6. [License](#license)

## Introduction
"What Should I Draw Today?" is an open-source iOS application designed to help artists overcome creative blocks. The app offers two main generators: Fusion Generator and Mad Lib Style Art Generator.

## Features
### Fusion Generator
- Combines two different characters from various categories to create a unique art prompt.
- The character names will visually cycle through until the user decides to 'stop'.
- **Relevant Files:**
  - `FusionGeneratorView.swift`

### Mad Lib Style Art Generator
- Provides a storyline that artists can draw, featuring elements like characters, artifacts, and environments.
- **Relevant Files:**
  - `Prompts.swift`

## Getting Started
To get started with the project, you'll need Xcode and an Apple Developer account. Clone the repository and open `WSIDT.xcodeproj` in Xcode.

## File Structure
- `WSIDT/WSIDT.xcodeproj`: Xcode project files.
- `WSIDT/WSIDT/Assets.xcassets`: Asset files for your app.
- `WSIDT/WSIDT/Data`: Contains data files like `CharacterData.swift`, `Prompts.swift`.
- `WSIDT/WSIDT/Views`: Contains view files like `BackgroundView.swift`, `ContentView.swift`, `Favoritesview.swift`, `FusionGeneratorView.swift`, `GeneratorView.swift`.

## How to Contribute
## How to Contribute 🤝

- Fork the Repository: Click on the 'Fork' button at the top-right corner of this page.
- Clone Your Fork: 
`git clone https://github.com/your-username/WSIDT.git`
- Navigate to the Project Folder
`cd WSIDT`
- Fetch Upstream Branches
`git fetch upstream`
- Switch to the Appropriate Branch: Use `git checkout <branch-name>` to switch to the branch that is relevant to your contribution. 
For example, if you are working on the <b>`Fusion Generator`</b>, you might switch to a branch named `fusion-generator-dev`.

## License
This project is licensed under the terms of the MIT License.

