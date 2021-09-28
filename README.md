# AR Live Posters
 <p align = "left" >
  <img width="1000" height="550" src="assets/gifs/intro.gif">
 
</p>

## Introduction
Augmented reality application to place user uploaded images of posters on physical walls in
the real-world environment.

Built for Android only. 

## Technologies & Architecture

Built using [Flutter app development framework](https://flutter.dev/). Flutter is a cross-platform hybrid app development platform which allows for a native applications to be built for i0S, Android, desktio and the web using a single codebase. 

[ArCore](https://developers.google.com/ar/develop) is Google's platform for building augmented reality experiences. "Using different APIs, ARCore enables your phone to sense its environment, understand the world and interact with information."

#### Plugins
* Arcore Core Flutter Plugin: ^0.0.11
* Dart Math
* Flutter Xlider: ^3.4.0
* Image Picker: ^0.8.3+3

## Features
**Upload Page:** Allows for user inputted images of their desired posters from their gallery. 

**Position & Rotation Controller:** Control on Positional and Rotational changes to nodes of the AR Image. Both Positional and Rotational funcitonality is built on constructing altered objects from quaternion-based values.

**Sizing Controller:** Allows for Resizing for AR image through the scale controller. 
