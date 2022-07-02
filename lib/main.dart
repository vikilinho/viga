import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() async {
  final goldrush = GoldRush();
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();

  runApp(GameWidget(game: goldrush));
}

class GoldRush with Loadable, Game {
  static const int squareSpeed = 250; //animation speed of the squares
  static final squarePaint =
      BasicPalette.green.paint(); //color of the square (a ball)
  static const squareWidth = 100; //width of the square (a ball)
  static const squareHeight = 100; //height of the square (a ball)
  late Rect
      squarePosition; // position of the square after determing the center of the screen
  int squareDirection =
      1; //since it is a positive number, it will move to the right
  late double screenWidth,
      screenHeight,
      centerX,
      centerY; //variables for the screen size and center
  Future<void> onLoad() {
    super.onLoad();
    screenWidth = MediaQueryData.fromWindow(window).size.width;
    screenHeight = MediaQueryData.fromWindow(window).size.height;
    centerX = (screenWidth / 2) - (squareWidth / 2);
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
  }

  @override
  void update(double dt) {
    // TODO: implement update
  }
}
