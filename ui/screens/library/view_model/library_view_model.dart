// ui/screens/library_view_model.dart
import 'package:flutter/material.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/data/repositories/songs/song_repository.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/model/songs/song.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;

  List<Song> _songs = [];
  List<Song> get songs => _songs;
  Song? get currentSong => playerState.currentSong;

  LibraryViewModel({
    required this.songRepository,
    required this.playerState,
  }) {
    init();
    playerState.addListener(_onPlayerStateChanged);
  }

  void init() {
    _songs = songRepository.fetchSongs();
    notifyListeners();
  }

  void _onPlayerStateChanged() {
    notifyListeners();
  }

  void play(Song song) {
    playerState.start(song);
  }

  void stop() {
    playerState.stop();
  }

  @override
  void dispose() {
    playerState.removeListener(_onPlayerStateChanged);
    super.dispose();
  }
}
