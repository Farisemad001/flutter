# 🛒 Flutter Shopping App

## 📱 Overview

This is a fully functional shopping app built with **Flutter** and **Dart**, simulating a real-world e-commerce interface. It includes:
- A welcome screen
- Sign-up and sign-in forms with validation
- Animated navigation
- A responsive product home screen
- Add to cart functionality
- Optional Arabic localization

The app is designed to demonstrate clean code structure, best practices in Flutter development, and responsive UI principles.

---

## 🚀 Features

### ✅ Welcome Screen
- Custom font (Suwannaphum-Regular)
- Local + network image
- Centered layout with two buttons:
  - Sign Up
  - Sign In

### ✅ Sign Up & Sign In
- Form fields:
  - Full Name (Capitalized)
  - Email (must contain @)
  - Password (min 6 characters)
  - Confirm password
- Valid input shows dialog: `"Account created successfully"` or `"Account sign-in successfully"`
- Button navigates to shopping screen

### ✅ Animated Navigation
- Smooth fade transition from Sign-Up/Sign-In screen to the Shopping screen

### ✅ Shopping Home Screen
- AppBar titled **"Our Products"**
- PageView of featured products (horizontal scroll)
- GridView of product cards (2 per row)
  - Product image
  - Product title
  - Add to Cart icon
  - Snackbar on add: `"Item added to cart"`
- ListView of **"Hot Offers"** section with 5 scrollable items
---
## 🧱 Project Structure
lib/
├── main.dart
├── screens/
│ ├── welcome_screen.dart
│ ├── sign_in.dart
│ ├── sign_up.dart
│ └── shopping_home.dart
assets/
├── images/
│ └── local_image.png
├── fonts/
│ └── Suwannaphum-Regular.ttf
screenshots/
└── (project UI screenshots)
