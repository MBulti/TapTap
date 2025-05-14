import 'package:flame/game.dart';
import 'package:taptap/bloc/game_bloc.dart';
import 'package:taptap/bloc/game_event.dart';
import 'package:taptap/game/enemy_component.dart';

class DungeonClickerGame extends FlameGame {
  final GameBloc gameBloc;

  DungeonClickerGame(this.gameBloc);

  @override
  Future<void> onLoad() async {
    add(
      EnemyComponent(
        onTap: () {
          gameBloc.add(TapEnemy());
        },
      ),
    );
    await super.onLoad();
  }
}
