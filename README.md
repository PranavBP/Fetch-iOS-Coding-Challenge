# Desserts Recipe App

This is Fetch Rewards iOS Coding Challenge - a Native iOS SwiftUI app that allows users to browse dessert recipes using the following API: https://themealdb.com/api.php 

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Requirements](#requirements)
- [Getting Started](#getting-started)


## Overview

- This app is a delightful culinary companion designed to satisfy your sweet cravings. It offers you to explore and prepare a variety of desserts.
- You can navigate through enticing options and select your preferred dessert. Once a dessert is chosen, you can view the step-by-step instructions and ingredients required to cook the dessert.
  
## Features

1. The app has two main screens
  - DessertListView: Displays an array of desserts in a LazyVGrid fetched dynamically from the API endpoint "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert".
    
    <p float="left">
      <img src="/Fetch-Recipe/Other/Screenshots/Dessert.png" width="200" />
      <img src="/Fetch-Recipe/Other/Screenshots/Dessert2.png" width="200" /> 
    </p>

  - DessertDetailView: It provides detailed instructions and ingredients needed to craft the perfect dessert.

    <p float="left">
      <img src="/Fetch-Recipe/Other/Screenshots/DessertDetail.png" width="200" />
      <img src="/Fetch-Recipe/Other/Screenshots/DessertDetail2.png" width="200" /> 
    </p>



2.  Tabbar - The app demonstarted the usage of tabbar, it has 2 main tabs
  - Dessert - Shows the DessertListView
  - Settings - Displays the version number of app.

## Architecture

This app follow the MVVM architecture, below is the brief explaination.

1. Views: DessertListview, DessertDetailView
2. ViewModels: DessertListVM, DessertDetailVM
3. Models: Dessert, DessertDetail and Ingredient

## Requirements

- Xcode version: Please make sure you have the latest Xcode version 15.0 and above.
- iOS version: This projects minimum deployement target is iOS 15.0, as Fetch also supports 15 and above.

## Getting Started

1. Clone this repository to your local machine
2. Navigate to this folder, or open the Fetch-Recipe.xcodeproj
3. Build the project from Xcode
4. Choose a simulator higher than iOS 15.0 and run the app.

