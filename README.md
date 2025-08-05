# emu8086-quiz-game
# DOS Quiz Game (x86 Assembly)

Welcome to the **DOS Quiz Game**!  
A fun, interactive quiz game written entirely in x86 Assembly (8086 MASM/TASM style) for DOS. This project demonstrates classic Assembly programming, direct hardware interaction, and a console-based quiz adventure with multiple categories.

---

## Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [How to Run](#how-to-run)
- [Game Categories](#game-categories)
- [Gameplay Instructions](#gameplay-instructions)
- [Screenshots](#screenshots)
- [Code Structure](#code-structure)
- [Customization](#customization)
- [License](#license)

---

## About the Project

This project is a text-based quiz game for DOS, implemented in x86 Assembly language. It features a main menu, five quiz categories, immediate feedback for each answer, score calculation, and replayability—all displayed directly in the console with classic DOS interrupts.

---

## Features

- **Classic DOS interface** using BIOS and DOS interrupts
- **Five quiz categories**:
  - General Knowledge
  - Science & Tech
  - History
  - Sports
  - Movies & Entertainment
- **Immediate feedback**: Know instantly if your answer is correct or wrong
- **Score calculation**: Tracks correct answers out of 5 per category
- **View correct answers** at the end
- **Replay option** to try again
- **Input validation** and error messages

---

## How to Run

1. **Requirements:**
   - DOSBox (Recommended for modern systems)
   - MASM or TASM assembler (e.g., `masm`, `tasm`, or compatible)
   - A DOS environment or emulator

2. **Steps:**
   - Save the code as `quiz.asm`
   - Assemble:
     - For MASM:  
       `masm quiz.asm;`
     - For TASM:  
       `tasm quiz.asm`
   - Link:
     - For MASM:  
       `link quiz.obj;`
     - For TASM:  
       `tlink quiz.obj`
   - Run in DOSBox or DOS:  
     `quiz.exe`

---

## Game Categories

1. **General Knowledge**
2. **Science & Tech**
3. **History**
4. **Sports**
5. **Movies & Entertainment**

Each category contains 5 unique, multiple-choice questions.

---

## Gameplay Instructions

1. **Start the game**: Choose "Start Game" from the menu.
2. **Select a category**: Enter the number (1-5) for your desired quiz category.
3. **Answer questions**: For each question, type `A`, `B`, or `C` (case-insensitive) to select your answer.
4. **Feedback**: After each question, you'll see if your answer was correct or wrong.
5. **Results**: At the end, your score and the correct answers will be displayed.
6. **Replay**: You can choose to play again or quit.

**Note:** Input validation ensures you must enter valid menu, category, and answer choices.

---

## Code Structure

- **.data section**:  
  All strings, questions, answers, and messages are defined for each category.

- **.code section**:  
  - `main`: Program entry, menu, score, category selection, main loop.
  - `display_question`: Shows the current question based on category.
  - `get_answer`: Handles and validates user input for answers.
  - `check_answer`: Compares user choice to correct answer, updates score.
  - `clear_screen`: Calls video interrupt to clear the display.

- **Interrupts used**:
  - `int 21h`: DOS system calls for printing and input
  - `int 10h`: Video interrupt for clearing the screen

- **Flow**:  
  Menu → Category → 5 Questions → Results → Replay/Quit

---

## Customization

- **Add new questions**:  
  Extend the `.data` section with more questions/answers per category, and update logic in `.code`.
- **Change categories**:  
  Modify the category strings and respective logic.
- **Change scoring**:  
  Adjust how scores are tracked or displayed.

---

## License

This project is for educational purposes and open for modification and sharing.  
Feel free to use, modify, and distribute!

---

## Author

Made with ❤️ in Assembly by [Mishal Saleem,Haniya Wajid]  

```
## Screenshots

<!--
### Main Menu
<img width="975" height="549" alt="image" src="https://github.com/user-attachments/assets/ce48372e-8485-4809-9ad1-e5a835754889" />


### Category Selection
<img width="975" height="547" alt="image" src="https://github.com/user-attachments/assets/c9ee4320-48a6-44e9-8b52-a70c42c27c04" />


### Question Example
<img width="975" height="543" alt="image" src="https://github.com/user-attachments/assets/b037c4d8-7626-4567-ae91-308925392f30" />


### Result Screen
<img width="975" height="119" alt="image" src="https://github.com/user-attachments/assets/10fe8be3-1538-47e2-9617-db885a9e6afe" />

<img width="975" height="110" alt="image" src="https://github.com/user-attachments/assets/09f31838-0600-477a-9fde-897df75f5e65" />

<img width="975" height="542" alt="image" src="https://github.com/user-attachments/assets/699941ad-f08d-45b7-9799-91d52a012103" />


---

**Enjoy the nostalgia and challenge your knowledge!**
