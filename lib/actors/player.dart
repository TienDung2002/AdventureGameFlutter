import 'dart:async';
import 'package:flame/components.dart';
import 'package:pixel_adventure_game/pixel_adventure.dart';


enum PlayerState { idle, running, jump, fall, ground, hit, atk_1, atk_2, atk_3, airatk_1, airatk_2, throwSword}

class Player extends SpriteAnimationGroupComponent<PlayerState> with HasGameRef<PixelAdventure> {

  final double stepTime = 0.1;
  final String basePath = 'Captain Clown Nose/Sprites/Captain Clown Nose/Captain Clown Nose with Sword/';

  @override
  FutureOr<void> onLoad() async {
    await _loadAllAnimations();
    return super.onLoad();
  }

  Future<void> _loadAllAnimations() async {
    animations = {
      PlayerState.idle: await _loadAnimation('09-Idle Sword', 'Idle Sword', 5),
      PlayerState.running: await _loadAnimation('10-Run Sword', 'Run Sword', 5),
      PlayerState.jump: await _loadAnimation('11-Jump Sword', 'Jump Sword', 3),
      PlayerState.fall: await _loadAnimation('12-Fall Sword', 'Fall Sword', 1),
      PlayerState.ground: await _loadAnimation('13-Ground Sword', 'Ground Sword', 2),
      PlayerState.hit: await _loadAnimation('14-Hit Sword', 'Hit Sword', 4),
      PlayerState.atk_1: await _loadAnimation('15-Attack 1', 'Attack 1', 3),
      PlayerState.atk_2: await _loadAnimation('16-Attack 2', 'Attack 2', 3),
      PlayerState.atk_3: await _loadAnimation('17-Attack 3', 'Attack 3', 3),
      PlayerState.airatk_1: await _loadAnimation('18-Air Attack 1', 'Air Attack 1', 3),
      PlayerState.airatk_2: await _loadAnimation('19-Air Attack 2', 'Air Attack 2', 3),
      PlayerState.throwSword: await _loadAnimation('20-Throw Sword', 'Throw Sword', 3),
    };
    current = PlayerState.idle;
  }

  Future<SpriteAnimation> _loadAnimation(String folderName, String characName, int frameCount) async {
    final frames = <Sprite>[];
    for (int i = 1; i <= frameCount; i++) {
      final imageNumber = i.toString().padLeft(2, '0');
      final image = await gameRef.images.load('$basePath$folderName/$characName $imageNumber.png');
      frames.add(Sprite(image));
    }
    return SpriteAnimation.spriteList(frames, stepTime: stepTime);
  }
}