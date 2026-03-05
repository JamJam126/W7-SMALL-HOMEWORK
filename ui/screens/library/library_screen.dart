import 'package:flutter/material.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/data/repositories/songs/song_repository.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/screens/library/view_model/library_view_model.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/screens/library/widgets/library_content.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/states/player_state.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/states/settings_state.dart';
import 'package:provider/provider.dart';


class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final songRepository = context.read<SongRepository>();
    final playerState = context.watch<PlayerState>();
    final settingsState = context.read<AppSettingsState>();

    final viewModel = LibraryViewModel(
      songRepository: songRepository,
      playerState: playerState,
    );

    return LibraryContent(
      viewModel: viewModel,
      settingsState: settingsState,
    );
  }
}
