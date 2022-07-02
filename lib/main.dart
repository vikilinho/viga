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
  late Rect squarePosition;
  int squareDirection = 1;
  late double screenWidth, screenHeight, centerX, centerY;

  @override
  void render(Canvas canvas) {
    // TODO: implement render
  }

  @override
  void update(double dt) {
    // TODO: implement update
  }
}
