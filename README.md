
# todo: A Sample todo Application

## Overview

Todo is a sample Flutter application designed to showcase best practices in software architecture and design patterns. It follows Clean Architecture principles and employs the BLoC (Business Logic Component) pattern for state management.

## Features

- Add Tasks: Easily add new tasks to your list. 
- Delete Tasks: Remove completed or unnecessary tasks.
- Edit Tasks : Editing exiting task
- Task Management: Keep track of your to-do items.


## Clean Architecture

Clean Architecture is a software design philosophy that separates the concerns of an application into layers, each with a specific responsibility. The layers typically include:

1. **Presentation Layer**: Handles UI-related logic and interacts .
2. **Domain Layer**: Contains business logic, usecase,entities .
3. **Data Layer**: Manages data access, including interactions with local and remote data sources.

The separation of concerns makes the codebase modular, scalable, and easy to maintain.

## Code Pattern: GetX

GetX-specific functionalities for e.g :

- State Management
- Route Management
- Dependency Injection

## Libraries Used

- **get**: GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.
- **cloud_firestore**: For storing a data in database.
- **firebase_core**: A Flutter plugin to use the Firebase Core API, which enables connecting to multiple Firebase apps.


## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

- Flutter installed on your machine ([Installation Guide](https://flutter.dev/docs/get-started/install))
- Emulator or physical device for testing

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/zahra-choksi/todo.git
2. Change into the project directory:

   ```bash
    cd todo
3. Install dependencies:

    ```bash
    flutter pub get
4. Run the app:

    ```bash
   flutter run

