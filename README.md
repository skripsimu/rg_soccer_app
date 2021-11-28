# rg_soccer_app

## Solutions

My solution, in this application I use bloc for state management so that application performance is better, from the developer side it is also easier to maintain, and manage every condition. For the folder structure, I separate them according to their respective features to make it easier to maintain.

## Requirements
- Flutter (v 2.5.3)
- Dart Sdk (>=2.12.0 <3.0.0)

## Dependencies used
- flutter_bloc ^8.0.0 `for State Management`
- flutter_svg: ^0.23.0+1 `for Showing icon club & flag with format svg`
- http: ^0.13.4 `for making HTTP requests`
- intl: ^0.17.0 `for formatting date`
- shimmer: ^2.0.0 `for shimmer loading animation`
- stream_transform: ^2.0.0 `for Blocks events for a duration after an event is successfully emitted using throttle.`
- mocktail: ^0.2.0 `for testing`
- bloc_test: ^9.0.1 `for testing`

## How to run?

Select a project
```
cd <project-name>
```
Install dependencies
```
flutter pub get
```
Run the app
```
flutter run
```

## How to build release app?
- For Android :

Select a project
```
cd <project-name>
```
Install dependencies
```
flutter pub get
```
Run the app
```
flutter build apk --release
```

## Summary

The app I created has 3 pages:
1. competition list
2. league table
3. available matches.

On each page, there are 3 conditions when the application is successfully loaded, error or does not have data from api. I also changed the transition between pages and added a loading indicator.
