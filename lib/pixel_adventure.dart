import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:pixel_adventure_game/levels/level.dart';

class PixelAdventure extends FlameGame{
  @override
  Color backgroundColor() => const Color(0xFF211F30); // màu trong suốt cho màn hình map

  late final CameraComponent cam;
  final world = Level(levelName: 'Level_01');

  @override
  FutureOr<void> onLoad() async {
    // load tất cả ảnh vào cache
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(world: world, width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);
    return super.onLoad();
  }
}