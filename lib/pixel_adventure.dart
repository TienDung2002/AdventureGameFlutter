import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';
import 'package:pixel_adventure_game/actors/player.dart';
import 'package:pixel_adventure_game/levels/level.dart';

class PixelAdventure extends FlameGame with HasKeyboardHandlerComponents, DragCallbacks{
  @override
  Color backgroundColor() => const Color(0xFF211F30); // màu trong suốt cho màn hình map

  late final CameraComponent cam;
  late JoystickComponent joystick;
  Player newPlayer = Player();

  @override
  FutureOr<void> onLoad() async {
    // load tất cả ảnh vào cache
    await images.loadAllImages();

    // Khởi tạo thế giới
    final world = Level(
      levelName: 'Level_02', 
      player: newPlayer
    );

    cam = CameraComponent.withFixedResolution(world: world, width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);
    addJoystick();

    return super.onLoad();
  }
  @override
  void update(double dt) {
    updateJoystick();
    super.update(dt);
  }
  
  void addJoystick() {
    joystick = JoystickComponent(
      knob: SpriteComponent(
        sprite: Sprite(images.fromCache('HUD/Knob.png')),
      ),
      background: SpriteComponent(
        sprite: Sprite(images.fromCache('HUD/Joystick.png')),
      ),
      margin: const EdgeInsets.only(left: 32, bottom: 32),
    );
    
    add(joystick);
  }
  
  void updateJoystick() {
    switch (joystick.direction) {
      case JoystickDirection.left:
        newPlayer.playerDirect = PlayerDirection.left;
        break;
      case JoystickDirection.right:
        newPlayer.playerDirect = PlayerDirection.right;
        break;
      default:
        newPlayer.playerDirect = PlayerDirection.none;
    }
  }
      

}