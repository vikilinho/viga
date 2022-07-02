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
  static const int squareSpeed = 250;
  static final squarePaint = BasicPalette.green.paint();
  static final squareWidth = 100;
  static final squareHeight = 100;

  @override
  void render(Canvas canvas) {
    // TODO: implement render
  }

  @override
  void update(double dt) {
    // TODO: implement update
  }
}
