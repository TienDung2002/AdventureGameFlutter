import 'dart:async';
import 'package:flame/components.dart';
import 'package:pixel_adventure_game/pixel_adventure.dart';

enum CrustyCrewState {
  idle,
  run,
  jump,
  fall,
  ground,
  anticipation,
  attack,
  hit,
  deadHit,
  deadGround,
  attackEffect
}

class CrustyCrew extends SpriteAnimationGroupComponent<CrustyCrewState>
    with HasGameRef<PixelAdventure> {
  
  final double stepTime = 0.1;
  final String basePath;

  // Constructor
  CrustyCrew({required Vector2 position, required this.basePath}) : super(position: position);


  @override
  FutureOr<void> onLoad() async {
    await _loadAllAnimations();
    return super.onLoad();
  }

  Future<void> _loadAllAnimations() async {
    animations = {
      CrustyCrewState.idle: await _loadAnimation('01-Idle', 'Idle', 8),
      CrustyCrewState.run: await _loadAnimation('02-Run', 'Run', 6),
      CrustyCrewState.jump: await _loadAnimation('03-Jump', 'Jump', 3),
      CrustyCrewState.fall: await _loadAnimation('04-Fall', 'Fall', 1),
      CrustyCrewState.ground: await _loadAnimation('05-Ground', 'Ground', 2),
      CrustyCrewState.anticipation: await _loadAnimation('06-Anticipation', 'Anticipation', 3),
      CrustyCrewState.attack: await _loadAnimation('07-Attack', 'Attack', 4),
      CrustyCrewState.hit: await _loadAnimation('08-Hit', 'Hit', 4),
      CrustyCrewState.deadHit: await _loadAnimation('09-Dead Hit', 'Dead Hit', 4),
      CrustyCrewState.deadGround: await _loadAnimation('10-Dead Ground', 'Dead Ground', 4),
      CrustyCrewState.attackEffect: await _loadAnimation('11-Attack Effect', 'Attack Effect', 3),
    };
    current = CrustyCrewState.idle;
  }

  Future<SpriteAnimation> _loadAnimation(
      String folderName, String characName, int frameCount) async {
    final frames = <Sprite>[];
    for (int i = 1; i <= frameCount; i++) {
      final imageNumber = i.toString().padLeft(2, '0');
      final imagePath = '$basePath$folderName/$characName $imageNumber.png';
      // print('Loading image: $imagePath'); // kiểm tra đường dẫn ảnh
      final image = await gameRef.images.load(imagePath);
      frames.add(Sprite(image));
    }
    // if (frames.isEmpty) {
    //   print('No frames loaded for $folderName'); // kiểm tra nếu không tải được frame nào
    // }
    return SpriteAnimation.spriteList(frames, stepTime: stepTime);
  }
}
