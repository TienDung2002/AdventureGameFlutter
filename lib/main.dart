import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:pixel_adventure_game/pixel_adventure.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();  // đảm bảo tất cả widget dc khởi chạy
  Flame.device.fullScreen(); // full màn
  Flame.device.setLandscape(); // set sang màn hình ngang

  PixelAdventure game = PixelAdventure();
  runApp(GameWidget(game: kDebugMode ? PixelAdventure() : game));
}

