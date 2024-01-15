# Desserts Recipe App

This is Fetch Rewards iOS Coding Challenge - a Native iOS SwiftUI app that allows users to browse dessert recipes using the following API: [The MealDB Dessert API](https://themealdb.com/api.php) 

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Requirements](#requirements)
- [Getting Started](#getting-started)


## Overview

- This app is a delightful culinary companion designed to satisfy your sweet cravings. It allows you to explore and prepare a variety of desserts.
- You can navigate through enticing options and select your preferred dessert. Once a dessert is chosen, you can view the step-by-step instructions and ingredients required to cook the dessert.

https://github.com/PranavBP/Fetch-iOS-Coding-Challenge/assets/59755967/f7770128-d02b-4ac8-8367-fc5acde2b545

## Features

1. The app has two main screens
  - DessertListView: Displays an array of desserts in a LazyVGrid fetched dynamically from the API endpoint: (https://themealdb.com/api/json/v1/1/filter.php?c=Dessert).
    
    <p float="left">
      <img src="/Fetch-Recipe/Other/Screenshots/Dessert.png" width="200" />
      <img src="/Fetch-Recipe/Other/Screenshots/Dessert2.png" width="200" /> 
    </p>

  - DessertDetailView: It provides detailed instructions and ingredients to cook the perfect dessert. The details of the dessert are fetched from the API endpoint (https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID), where MEAL_ID is id of the dessert

    <p float="left">
      <img src="/Fetch-Recipe/Other/Screenshots/DessertDetail.png" width="200" />
      <img src="/Fetch-Recipe/Other/Screenshots/DessertDetail1.png" width="200" />
      <img src="/Fetch-Recipe/Other/Screenshots/DessertDetail2.png" width="200" /> 
    </p>


2.  Tabbar - The app demonstrates the usage of TabBar, it has 2 main tabs
  - Desserts - Shows all the desserts.
  - Settings - Displays the version number of the app, name, and details for the contributor. 

## Architecture

This app follows the MVVM architecture, I've included a brief explanation below.

1. Views: 
  - DessertListview:
    - Presents a collection of desserts in a LazyVGrid, with each Dessert represented as an individual card(DessertCardView).
  - DessertCardView:
    - This card is an abstracted SwiftUI view, which shows the image and name of the dessert. 
  - DessertDetailView:
    - This view shows the image, instructions, and ingredients of the dessert.

2. ViewModels:
   - DessertListVM:
     - This class includes ```fetchData()``` method that initiates a network request to the MealDB API. The API response, containing the dessert data, is asynchronously processed.
     - The dessert data undergoes two main operations: Handling null values and alphabetical sorting the desserts.
   - DessertDetailVM:
     - This class includes ```fetchDessertDetail()``` method that takes in a parameter "mealID", and initiates a network request to the MealDB API. The API response contains the data of all the ingredients and instructions. 

3. Models: 
  - Dessert
  - DessertDetail
  - Ingredient

## Requirements

- Xcode version: Please ensure you have the latest Xcode version 15.0 and above.
- iOS version: This project's minimum deployment target is iOS 15.0, as Fetch also supports 15 and above.

## Getting Started

1. Clone this repository to your local machine
2. Navigate to this folder, or open the Fetch-Recipe.xcodeproj
3. Build the project from Xcode
4. Choose a simulator higher than iOS 15.0 and run the app.

