# Weather App README
[![Weather App Demo]([https://img.youtube.com/vi/YOUR_VIDEO_ID_HERE/0.jpg](https://www.google.com/url?sa=i&url=https%3A%2F%2Fpngtree.com%2Fso%2Fvideo-recording-screen&psig=AOvVaw3G2ur4rwawW8AYQTjqURXq&ust=1721864156679000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPCNoIKqvocDFQAAAAAdAAAAABAE))]([https://www.youtube.com/watch?v=YOUR_VIDEO_ID_HERE](https://drive.google.com/file/d/1DVJrsrO1RJurFmMjze28oh8diCccvqQF/view?usp=sharing))
## Overview
This Flutter application is designed to fetch and display weather information based on user input. It uses the OpenWeather API for weather data retrieval and incorporates various Flutter functionalities for an interactive user experience.

## Features
1. **UI Design:**
    - **Search Page:**
        - A search bar at the top to enter the city name.
        - A search button to initiate the search.
    - **Results Page:**
        - Display a list of cities matching the search query.
        - Each list item shows the city name and a brief weather summary (temperature and weather description).
        - Tapping on a city navigates to the details page for that city.
    - **Details Page:**
        - Display detailed weather information for the selected city.
        - Includes city name, temperature, weather description.
        - Optionally, an icon representing the weather condition.
        - A list of the next 5 days' forecast, each with temperature and weather icon.

2. **State Management:**
    - Implemented using BLoC (Business Logic Component) for managing app state.
    - Manages loading, error, and success states efficiently.

3. **Repository Pattern:**
    - Utilizes the repository pattern to abstract data sources and handle data operations.
    - Facilitates separation of concerns between data layer and presentation layer.

4. **MVVM Pattern:**
    - Adheres to the Model-View-ViewModel architectural pattern.
    - Ensures clear separation of UI, business logic, and data handling responsibilities.

5. **Pull-to-Refresh:**
    - Implements pull-to-refresh functionality to update weather information.
    - Allows users to refresh weather data manually for real-time updates.
