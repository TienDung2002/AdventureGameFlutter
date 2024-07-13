import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:pixel_adventure_game/actors/crustycrew.dart';
import 'package:pixel_adventure_game/actors/player.dart';

class Level extends World {
  final Player player;
  // final CrustyCrew crustyCrew;
  final String levelName;  
  late TiledComponent level;

  // Constructor
  Level({required this.levelName, required this.player});


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
          player.position = Vector2(spawnPoint.x, spawnPoint.y);
          add(player);
          break;
        // case 'CrustyCrew':
        //   crustyCrew.position = Vector2(spawnPoint.x, spawnPoint.y);
        //   add(crustyCrew);
        //   break;
        default:
      }
    }

    return super.onLoad();
  }
}
