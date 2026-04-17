# CarLi_Et

Professional Internship Management Application for Ethiopian University Students



## Overview

CarLi_Et (Career Link Ethiopia) is a mobile application designed to simplify and digitize the internship process for Ethiopian university students. The platform connects students with organizations and provides a structured system to manage internship applications, track progress, and handle evaluations — all in one place.



## Goal

The goal of CarLi_Et is to:

* Bridge the gap between students and organizations
* Simplify internship application and management processes
* Provide a centralized and transparent system for tracking internships
* Ensure a more organized, efficient, and fair internship experience



## Project Description

CarLi_Et serves as a central hub where:

* Students can discover and apply for internships
* Organizations can post opportunities and manage applicants
* Both parties can track progress and receive updates

The system is designed to work locally, making it lightweight and suitable for controlled environments such as university systems.



## Team Members


| Full Name        | ID Number   |
|------------------|------------|
| Hanna Alemyehu   | UGR/2795/16 |
| Hayat Abdulkerim | UGR/0826/16 |
| Kaleab Lemma     | UGR/2941/16 |
| Rediet Kifle     | UGR/8926/16 |
| Yanet Abrham     | UGR/0385/16 |



## Features

### 1. Authentication & Authorization

* Secure user registration and login
* University-based credential validation (using university email)
* Role-based access:

  * Students: apply and track internships
  * Organizations: post and manage internships
* Token-based authentication handled via REST API



### 2. User Profile Management (CRUD)

Users can:

* Create and manage their profiles
* Update personal and academic information (skills, interests, experience)
* View profile details
* Delete their account



### 3. Internship Management System (CRUD)

#### For Students:

* Browse available internships
* Apply to internships
* Track application status
* View internship details

#### For Organizations:

* Create and post internship opportunities
* View applicants for each internship
* Access student resumes
* Update internship details
* Delete outdated postings



### 4. Notification System

* Students receive updates on application status (accepted/rejected)
* Organizations are notified when students apply
* Keeps both sides informed



## Backend Responsibilities (REST API)

The backend system will:

* Manage user authentication and authorization
* Handle profile creation and updates
* Store and retrieve internship listings
* Process internship applications
* Manage application status (pending, accepted, rejected)
* Handle notification logic
* Ensure secure access control between users
* Maintain all data in a local database

### Important

* Runs on localhost
* No external hosting or cloud services
* No Firebase or Firestore used



## Technologies Used

* Frontend: Flutter
* Backend: Node.js / Express
* Database: Local database


## Testing Strategy

* Unit Testing: Validate business logic
* Widget Testing: Ensure UI components work correctly
* Integration Testing: Test complete workflows



## Setup Instructions

This project runs in a local environment only.

### 1. Start Backend

* Ensure your local server is running
* Make sure the database is connected

### 2. Configure API

* Set the API base URL in the Flutter app to your local machine IP

### 3. Run the App

```bash
flutter pub get
flutter run
```

