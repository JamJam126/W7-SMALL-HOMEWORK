import 'package:flutter/material.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/data/repositories/songs/song_repository.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/data/repositories/users/user_history_repository.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/screens/home/view_model/home_view_model.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/screens/home/widgets/home_content.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/states/player_state.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/states/settings_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final songRepo = context.read<SongRepository>();
    final historyRepo = context.read<UserHistoryRepository>();
    final playerState = context.watch<PlayerState>();
    final settingsState = context.read<AppSettingsState>();

    final viewModel = HomeViewModel(
      songRepo: songRepo, 
      historyRepo: historyRepo, 
      playerState: playerState
    );

    return HomeContent(
      viewModel: viewModel,
      appSettingsState: settingsState,
    );
  }
}
