import 'package:flutter/material.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/theme/theme.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/model/songs/song.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/screens/home/view_model/home_view_model.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/states/settings_state.dart';

class HomeContent extends StatelessWidget {
  final AppSettingsState appSettingsState;
  final HomeViewModel viewModel;

  HomeContent({required this.appSettingsState, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final recentSongs = viewModel.recentSongs;
    final recommendedSongs = viewModel.recommendedSongs;
    final currentSong = viewModel.currentSong;

    return Container(
      color: appSettingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text("Home", style: AppTextStyles.heading),
          const SizedBox(height: 30),

          Expanded(
            child: ListView(
              children: [
                Text("Your recent songs", style: AppTextStyles.label),

                ...recentSongs.map((song) {
                  return SongTile(
                    song: song,
                    isPlaying: song == currentSong,
                    onTap: () => viewModel.playSong(song),
                  );
                }),

                const SizedBox(height: 30),

                Text('You might also like', style: AppTextStyles.label),

                ...recommendedSongs.map((song) {
                  return SongTile(
                    song: song,
                    isPlaying: song == currentSong,
                    onTap: () => viewModel.playSong(song),
                  );
                }),
              ],
            ),
          ),

          /// Stop Button
          // if (viewModel.isPlaying)
          //   Padding(
          //     padding: const EdgeInsets.all(16),
          //     child: ElevatedButton(
          //       onPressed: viewModel.stop,
          //       child: const Text("STOP"),
          //     ),
          //   ),
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
        style: const TextStyle(color: Colors.amber),
      ),
    );
  }
}
