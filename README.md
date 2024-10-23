# Othaim Ecommerce

Welcome to Othaim Ecommerce, an e-commerce application designed to provide a seamless shopping
experience. This README outlines the current state of the project, including the initial project
structure, backend setup, authentication, onboarding splash screens, and the use of GetX state
management.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [App structure](#app-structure)
- [Installation](#installation)
- [Packages Used](#packages-used)
- [Backend Services](#backend-services)
- [State Management](#state-management)
- [Areas covered by unit tests and TDD.](#tdd)
- [License](#license)

## Project Overview

Othaim Outfit is an e-commerce platform aimed at providing users with a user-friendly interface to
browse and purchase outfits. The project is currently in its development phase, with significant
progress made in setting up the foundational elements.

## Features

- User Friendly UI
- Responsive Design
- Error Handling and Constants Management
- Caching System
- Search and Filter Products
- Cart Management
- Included TDD
- GetX State Management Integration

## Technologies Used

- **Flutter**: For front-end development.
- **Dart**: Programming language for Flutter.
- **GetX**: State management.
- **Backend Services**: Custom-built to handle various functionalities.

## App Structure

   ```bash
├── lib/
│   ├── api/
│   │   └── api_service.dart
│   ├── bindings/
│   │   └── app_bindings.dart
│   ├── controllers/
│   │   ├── cart_controller.dart
│   │   └── product_controller.dart
│   ├── models/
│   │   └── product.dart
│   │   └── cart_item.dart
│   ├── screens/
│   │   ├──  widgets:
│   │       ├── product_detail_screen.dart
│   │       ├── product_item.dart
│   │   ├── home_screen.dart
│   │   └── cart_screen.dart
│   ├── utils/
│   │   └── api_error_handler.dart
│   ├── main.dart
├── test/
│   ├── add_product_to_cart.dart
├── README.md
├── pubspec.yaml
├── .gitignore
└── analysis_options.yaml
   ```

## Installation

To get started with Othaim Outfit, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mahmoodfathy227/othaim.git
   cd othaim
   flutter pub get
   flutter run

## Packages Used

- **get**: GetX is a powerful Flutter package that provides high-performance state management,
  intelligent dependency injection, and route management in a clean, simple way. It's favored over
  alternatives for its minimal boilerplate, ease of use, and comprehensive ecosystem.

*************************************************************************************************

- **cached_network_image**: cached_network_image is a handy Flutter package that simplifies loading
  images from the internet while efficiently handling caching to improve performance. It’s ideal for
  apps with heavy image usage as it reduces bandwidth consumption and speeds up image rendering,
  avoiding redundant network calls.

*************************************************************************************************

- **connectivity_plus**: connectivity_plus is a Flutter package that helps you monitor network
  connectivity status (WiFi, mobile data, etc.) in real-time. It's great for apps that need to
  handle different network conditions gracefully, ensuring a smooth user experience even when
  connectivity fluctuates.

*************************************************************************************************

- **get_storage**: GetStorage is a powerful key-value storage solution from the GetX package that
  provides a simple way to store and retrieve data persistently without the complexity of setting up
  databases. It's particularly great for caching and session management due to its efficiency and
  ease of use.

*************************************************************************************************

- **skeletonizer**: Skeletonizer is a Flutter package that simplifies creating skeleton loaders for
  your UI1
  . Instead of building separate placeholder widgets, Skeletonizer wraps your existing layout,
  turning it into a shimmering skeleton loader while your data loads2
  . This makes it easy to implement a smooth and visually appealing loading experience with minimal
  effort2
  *************************************************************************************************
- **get_it**: GetIt is a service locator for Dart and Flutter applications1
  . It allows you to register and retrieve objects (services) throughout your app, making it easy to
  manage dependencies and decouple different parts of your code1
  . It's favored for its simplicity and efficiency in handling dependency injection.

## Backend Services

The backend is configured to handle various services, including:
Error Handling: Robust error management to ensure smooth operation.
Constants Management: Centralized location for constants to maintain consistency.

## State Management

We are using GetX for state management, providing efficient and reactive state handling throughout
the application.

## TDD

Areas Covered by Unit Tests and TDD in The App

1. State Management:
   Controllers: We utilize unit tests to ensure that the GetX controllers (e.g., CartController,
   ProductController) accurately manage the application state. This includes adding, updating, and
   removing items from the cart, and ensuring that product lists are correctly populated from the
   API.

*************************************************************************************************

2. API Integration:
   API Service: Unit tests validate the integration with external APIs, ensuring that the data
   fetching process handles both successful and error responses correctly. Our error handler class
   is thoroughly tested to confirm that it reacts appropriately to different HTTP status codes.

*************************************************************************************************

3. Data Models:
   Product Model: Tests cover the correctness of the Product model by verifying that JSON data is
   parsed correctly into Dart objects and vice versa. This ensures data consistency throughout the
   app.

*************************************************************************************************

4. UI Components:
   Widgets and Screens: Using both unit tests and widget tests, we verify that UI components behave
   as expected. This includes tests for the presence of critical UI elements, navigation between
   screens, and interactive components like buttons.

*************************************************************************************************

5. Business Logic:
   Cart Functionality: TDD ensures that the business logic for cart operations, such as adding,
   updating quantities, and removing items, is robust and error-free.

*************************************************************************************************

6. Network Handling and Caching:
   Connectivity and Caching: Tests validate network connectivity handling using the
   connectivity_plus package and ensure that caching with GetStorage works seamlessly without data
   loss or corruption.

*************************************************************************************************
By leveraging unit tests and TDD, we ensure that each part of the app functions reliably, leading to
a smoother development process and a more resilient application.

## License

For further information, feel free to contact us. Your feedback and suggestions are invaluable as we
continue to develop and enhance Othaim Outfit.

Developer :
Mahmoud Fathy

Website: https://mahmoodfathy227.github.io/my-portfolio/

Linkedin: https://www.linkedin.com/in/mahmood-fathy



