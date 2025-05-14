import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:taptap/bloc/game_event.dart';
import 'package:taptap/bloc/game_state.dart';

class GameBloc extends HydratedBloc<GameEvent, GameState> {
  GameBloc()
    : super(const GameState(gold: 0, damage: 1, enemyHp: 10, upgradeCost: 10)) {
    on<TapEnemy>((event, emit) {
      final newHp = state.enemyHp - state.damage;
      if (newHp <= 0) {
        // Exponentiell steigende HP basierend auf dem aktuellen Damage
        final newEnemyHp = (10 * 1.5 * state.damage).toInt();
        emit(state.copyWith(enemyHp: newEnemyHp, gold: state.gold + 5));
      } else {
        emit(state.copyWith(enemyHp: newHp));
      }
    });
    on<BuyUpgrade>((event, emit) {
      if (state.gold >= state.upgradeCost) {
        emit(
          state.copyWith(
            gold: state.gold - state.upgradeCost,
            damage: state.damage + 1,
            upgradeCost: 10 * (state.damage + 1),
          ),
        );
      }
    });
  }
  
@override
  GameState fromJson(Map<String, dynamic> json) {
    return GameState(
      gold: json['gold'] as int,
      damage: json['damage'] as int,
      enemyHp: json['enemyHp'] as int,
      upgradeCost: json['upgradeCost'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson(GameState state) {
    return {
      'gold': state.gold,
      'damage': state.damage,
      'enemyHp': state.enemyHp,
      'upgradeCost': state.upgradeCost,
    };
  }
}
