import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:pixel_adventure_game/pixel_adventure.dart';

void main() {
  PixelAdventure game = PixelAdventure();
  runApp(GameWidget(game: game));
}

