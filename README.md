# SimplePlanner

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Simple Planner is a planner app that manages your tasks. It is paired with a weather function so users can plan their days accordingly.

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

* User logs in to access their planner.
* User creates tasks.
* User can view weather.
* User can view tasks.
* User can use a pomodoro.
* User can change settings.

**Optional Nice-to-have Stories**

* User can color code their to-dos based on importance.
* User can change between dark mode and light mode.
* User can change their location and view the weather there.
* User can be alerted of weather events, especially if they may interfere with the user's plans.

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
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
