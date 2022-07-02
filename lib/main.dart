import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() async {
  // Create an instance of the game
  final goldRush = GoldRush();

  // Setup Flutter widgets and start the game in full screen portrait orientation
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();

  // Every is a widget in Flutter! So run the app passing the games widget here
  runApp(GameWidget(game: goldRush));
}

class GoldRush with Game {
  int squareSpeed = 250;
  int circleSpeed = 250;
  // The speed that our square will animate
  var squarePaint = BasicPalette.green.paint(); // The color of the square
  static const squareWidth = 50.0, squareHeight = 50.0;
  var circlePaint = BasicPalette.blue.paint(); // The color of the square
  static const circleOffset = 50.0,
      circleRadius =
          50.0; // The width and height of our square will be 100 x 100

  late Rect squarePos;
  late Rect circlePos; // The current position and size of our square

  // The direction our square is travelling in, 1 for left to right, -1 for right to left
  int squareDirection = 1;
  int circleDirection = -1;
  late double screenWidth, screenHeight, centerX, centerY;
  late double newcenterX, newcenterY;

  // Override this function to initialise game state and load game resources
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Get the width and height of our screen canvas
    screenWidth = MediaQueryData.fromWindow(window).size.width;
    screenHeight = MediaQueryData.fromWindow(window).size.height;

    // Calculate the center of the screen, allowing for the adjustment for the squares size
    centerX = (screenWidth / 2) - (squareWidth / 2);
    centerY = (screenHeight / 2) - (squareHeight / 2);
    newcenterX = (screenWidth / 4) - (circleOffset / 4);
    newcenterY = (screenHeight / 4) - (circleOffset / 4);

    // Set the initial position of the green square at the center of the screen with a size of 100 width and height
    squarePos = Rect.fromLTWH(centerX, centerY, squareWidth, squareHeight);
    circlePos =
        Rect.fromLTWH(newcenterX, newcenterY, circleRadius, circleOffset);
  }

  // Override this function to control what is drawn on the screen
  @override
  void render(Canvas canvas) {
    canvas.drawRect(squarePos, squarePaint);
    canvas.drawRect(circlePos, circlePaint);
    // Draw the green square on the canvas
  }

  // Override this function to update the game state since the time elapsed since the last update
  @override
  void update(double dt) {
    // Update the x position of the square based on the speed and direction and the time elapsed
    squarePos = squarePos.translate(squareSpeed * squareDirection * dt, 0);
    circlePos = circlePos.translate(circleSpeed * circleDirection * dt, 0);

    // If the square reaches the side of the screen reverse the direction the square is travelling in
    if (squareDirection == 1 && squarePos.right > screenWidth) {
      squareDirection = -1;
      squarePaint = BasicPalette.red.paint();
    } else if (squareDirection == -1 && squarePos.left < 0) {
      squareDirection = 1;
      squarePaint = BasicPalette.green.paint();
    }
    if (circleDirection == 1 && circlePos.right > screenWidth) {
      circleDirection = -1;
      circleSpeed = 250 + 10;
      circlePaint = BasicPalette.magenta.paint();
    } else if (circleDirection == -1 && circlePos.left < 0) {
      circleDirection = 1;
      circleSpeed = 250 + 10;
      circlePaint = BasicPalette.yellow.paint();
    }
  }
}
