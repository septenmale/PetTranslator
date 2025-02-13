# 🐾 PetTranslator

PetTranslator is an iOS application that allows users to "translate" their speech into pet language. The app provides a fun and interactive way to communicate with virtual pets by generating random predefined phrases in response to voice input.

## ✅ Features

- 🔒 **Microphone Permissions Handling**: Ensures proper permission handling before recording.
- 🐶 **Pet Selection**: Users can choose between a cat and a dog.
- 🎭 **Realistic Interaction Simulation**: The app stops recording after a fixed duration.
- 🔄 **Random Phrase Generation**: Translates speech into pre-defined pet expressions.
- 🖥 **Programmatic UI**: Built entirely using Swift programmatically without Storyboard.
- 🎨 **Smooth UI Transitions**: Includes animated state transitions during the translation process.
- ✅ **Full MVP Architecture**: Ensures clean separation of concerns for scalability.
- 🧪 **Comprehensive Unit Test Coverage**: The application is covered with unit tests.

## 🏗 Architecture

- The app follows the **Model-View-Presenter (MVP)** pattern to ensure a well-structured and testable architecture.
- **Services Layer** handles permissions, speech recognition, and translation logic.
- **Dependency Injection** is used to keep components loosely coupled.
- **Delegates** are implemented to prevent direct dependencies between layers.

## 🛠 Technical Requirements

- **Xcode 14+**
- **iOS 13.4+**

## 🏃 Running the Project

1. Clone the repository.
2. Open the project in **Xcode**.
3. Run the app on any iOS **13.4+** device or simulator.

## 🧪 Running Unit Tests

The application is covered with unit tests to ensure the correctness of its core logic. You can run them using:

1. Open **Xcode**.
2. Select **Product → Test** or use the shortcut `Cmd + U`.
3. Check the test results in the **Test Navigator**.

## 🔮 Future Development

Planned improvements and new features:

- 🎙 **Enable real-time speech recognition** (detect when the user stops speaking).
- 🏡 Introduce a virtual pet experience (interactive pet animations).
- 🔄 Implement bidirectional translation (Human ⇄ Pet).
- ✨ Expand the phrase database for more diverse translations.
- 🎵 Add sound effects to enhance the interaction.
- 🌙 Add **dark mode** support.
- 🌍 Implement **app localization**.
- 🚀 Improve animations and UI responsiveness.
- 🧪 Cover the app with **UI tests**.
- ⚙️ Implement **Settings screen navigation** functionality.

## 💬 Feedback & Contributions

We welcome feedback and contributions! If you find a bug or have an idea to improve the app, feel free to open an issue or submit a pull request.

---

🐾 **Enjoy translating with your pets!** 🐶🐱
