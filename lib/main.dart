import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taptap/bloc/game_bloc.dart';
import 'package:taptap/game/dungeon_clicker_game.dart';
import 'package:taptap/ui/overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  final gameBloc = GameBloc();
  final game = DungeonClickerGame(gameBloc);

  runApp(
    BlocProvider(
      create: (_) => gameBloc,
      child: GameWidget(
        game: game,
        overlayBuilderMap: {
          'HUD': (context, child) => GameOverlay(gameBloc),
        },
        initialActiveOverlays: ['HUD'],
      ),
    ),
  );
}
