Original App Design Project - README Template
===

# SimplePlanner

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)
3. [Build Progress](#Build-Progress)

## Overview
### Description
Simple Planner is a planner app that manages your to tasks. It is paired with a weather function so users can plan their days accordingly.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Productivity/Weather
- **Mobile:** Developed for mobile, but may be viable for other devices.
- **Story:** The user can add tasks and events and set titles, dates, deadlines, and a description. The app stores planning information for users to access at any time and updates them with weather information on respective dates.
- **Market:** Anyone can use this app if they want to.
- **Habit:** This app can be used as often as the user needs to manage their daily life.
- **Scope:** First this could start with any user with a tentative schedule, such as students or professionals, hoping to organize their schedule. This app could evolve to provide greater in-depth look of the user's location and its expected weather.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User logs in to access their planner.
- [x] User creates tasks.
- [x] User can view weather.
- [x] User can view tasks.
- [ ] User can use a pomodoro.
- [ ] User can change settings.

**Optional Nice-to-have Stories**

- [ ] User can color code their to-dos based on importance.
- [ ] User can change between dark mode and light mode.
- [ ] User can change their location and view the weather there.
- [ ] User can be alerted of weather events, especially if they may interfere with the user's plans.

### 2. Screen Archetypes

* Login
* Register
* Create tasks screen
   * Allows user add tasks and events and set titles, dates, deadlines, and a description.
* View tasks and weather screen
   * View current weather and task details.
* Pomodoro Screen
    * Can set a timer.
    * Can pause, resume, or cancel timer.
* Settings screen
    * Let people change weather location, notifications, and other app settings.
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Timer
* Settings

Optional:
* Calendar

**Flow Navigation** (Screen to Screen)

* Forced Log-in -> Account creation if no log in is available
* Home page: Current weather and tasks -> Create new task or review task details
* Timer -> n/a
* Settings -> Configure settings

## Wireframes
![](https://i.imgur.com/QY703Ko.png)

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
### Models
| Property | Type     |Description|
| -------- | -------- | -------- |
| userId   | String | unique id for the user|
| Task   | String | taks posted by user|
| DateLabel| String | Day of task|
| TimeLabel| String | Due Date of each task|
| LocationId| String | Weather location|
| WeatherInfo| String |Weather Information e.g. sunny|
| Temperature| Number | Current Temperature|
| CurrentTime| String | Current Time|
| PredictedWeather| String | Weather in the next few hours|
| PredictedTemperature| Number | Temperature in the next few hours|
| FutureTime| String | Next few hours after current time|


### Networking
- Home Feed Screen
    - (Read/GET) Query weather information
    ```swift
    // iOS
    // (Read/GET) Query all tasks where user is author
    let query = PFQuery(className:"Task")
    query.whereKey("author", equalTo: currentUser)
    query.order(byDescending: "DueDate")
    query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
       if let error = error {
          print(error.localizedDescription)
       } else if let posts = posts {
          print("Successfully retrieved \(posts.count) posts.")
          // TODO: Do something with posts...
       }
    }
    ```
    - (Read/GET) Query all tasks information
    - (Delete) Delete a task
- Create Post Screen
    - (Create/POST) Create a new task object
- Setting Screen
    - (Update/PUT) Update user profile settings

#### [OPTIONAL:] Existing API Endpoints
- Base URL: http://api.weatherapi.com/v1


| HTTP Verb | Endpoint | Description |
| --------  | -------- | -------- |
| GET      |/current.json or /current.xml| get Current Weather     |
| GET      |/forecast.json or /forecast.xml| get Forecast  |
| GET      |/timezone.json or /timezone.xml| get Timezone  |

## Build Progress
Log in and Sign Up Gif

![](https://i.imgur.com/UQjGM62.gif)

