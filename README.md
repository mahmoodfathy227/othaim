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
- [Contributions](#contributions)
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

lib/
**|- bindings/**
| |- app_binding.dart
**|- controllers/**
| |- cart_controller.dart
| |- product_controller.dart
**|- db/**
| |- database.dart
**|- models/**
| |- cart_item.dart
| |- product.dart
**|- screens/**
| |- widgets
| |- product_detail_screen.dart
| |- product_item.dart
| |- home_screen.dart
| |- item_details_screen.dart
**|- services/**
| |- api_service.dart
**|- utils/**
| |- api_error_handler.dart
| constants.dart
|- main.dart

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

## License

For further information, feel free to contact us. Your feedback and suggestions are invaluable as we
continue to develop and enhance Othaim Outfit.

Developer :
Mahmoud Fathy
Website: https://mahmoodfathy227.github.io/my-portfolio/
Linkedin: https://www.linkedin.com/in/mahmood-fathy



