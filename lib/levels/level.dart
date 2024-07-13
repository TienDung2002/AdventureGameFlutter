import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:pixel_adventure_game/actors/crustycrew.dart';
import 'package:pixel_adventure_game/actors/player.dart';

class Level extends World {
  final String levelName;  
  late TiledComponent level;

  // Constructor
  Level({required this.levelName});


  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));

    add(level);

    // lấy spawn point của player
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('SpawnPoints');
    for (final spawnPoint in spawnPointsLayer!.objects) {
      switch (spawnPoint.class_) {
        // kiểm tra class của spawnPoint và thêm player vào spawnpoint
        case 'Player':
          final player = Player(playerPosition: Vector2(spawnPoint.x, spawnPoint.y));
          add(player);
          break;
        case 'CrustyCrew':
          final crustyCrew = CrustyCrew(
            position: Vector2(spawnPoint.x, spawnPoint.y),
            basePath: 'The Crusty Crew/Sprites/Fierce Tooth/' // Crabby - Fierce Tooth - Pink Star
          );
          add(crustyCrew);
          break;
        default:
      }
    }

    return super.onLoad();
  }
}
