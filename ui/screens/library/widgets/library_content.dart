

import 'package:flutter/material.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/model/songs/song.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/screens/library/view_model/library_view_model.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/states/settings_state.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/theme/theme.dart';

class LibraryContent extends StatelessWidget {
  final LibraryViewModel viewModel;
  final AppSettingsState settingsState;

  const LibraryContent({
    super.key,
    required this.viewModel,
    required this.settingsState,
  });

  @override
  Widget build(BuildContext context) {
    final songs = viewModel.songs;
    final currentSong = viewModel.currentSong;

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),
          SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                final isPlaying = song == currentSong;
                return SongTile(
                  song: song,
                  isPlaying: isPlaying,
                  onTap: () => viewModel.play(song),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}