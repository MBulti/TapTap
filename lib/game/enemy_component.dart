import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class EnemyComponent extends PositionComponent
    with TapCallbacks, HasGameReference {
  final VoidCallback onTap;

  EnemyComponent({required this.onTap}) : super(size: Vector2(128, 128));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = Vector2((game.size / 2 - size / 2).x, (game.size / 4).y);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.green;
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  bool onTapDown(TapDownEvent event) {
    onTap();
    return true;
  }
}
