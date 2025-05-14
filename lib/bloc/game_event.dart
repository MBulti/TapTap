abstract class GameEvent {}

class TapEnemy extends GameEvent {}

class BuyUpgrade extends GameEvent {
  final String upgradeId;
  BuyUpgrade(this.upgradeId);
}