import 'package:equatable/equatable.dart';

class GameState extends Equatable {
  final int gold;
  final int damage;
  final int enemyHp;
  final int upgradeCost;

  const GameState({
    required this.gold,
    required this.damage,
    required this.enemyHp,
    required this.upgradeCost
  });

  GameState copyWith({
    int? gold,
    int? damage,
    int? enemyHp,
    int? upgradeCost
  }) {
    return GameState(
      gold: gold ?? this.gold,
      damage: damage ?? this.damage,
      enemyHp: enemyHp ?? this.enemyHp,
      upgradeCost: upgradeCost ?? this.upgradeCost
    );
  }

  @override
  List<Object> get props => [gold, damage, enemyHp, upgradeCost];
}