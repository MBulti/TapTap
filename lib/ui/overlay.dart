import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taptap/bloc/game_bloc.dart';
import 'package:taptap/bloc/game_event.dart';
import 'package:taptap/bloc/game_state.dart';

class GameOverlay extends StatelessWidget {
  final GameBloc gameBloc;
  const GameOverlay(this.gameBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<GameBloc, GameState>(
        bloc: gameBloc,
        builder: (context, state) {
          return Column(
            children: [
              Spacer(flex: 2,),
              Text('Gold: ${state.gold}'),
              Text('Damage: ${state.damage}'),
              Text('Enemy HP: ${state.enemyHp}'),
              ElevatedButton(
                onPressed: () => gameBloc.add(BuyUpgrade('dmg')),
                child: Text('Upgrade Damage (${state.upgradeCost} Gold)'),
              ),
              Spacer(flex: 1,)
            ],
          );
        },
      ),
    );
  }
}
