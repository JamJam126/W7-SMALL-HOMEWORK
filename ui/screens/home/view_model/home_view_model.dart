import 'package:flutter/material.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/data/repositories/songs/song_repository.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/data/repositories/users/user_history_repository.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/model/songs/song.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/ui/states/player_state.dart';

class HomeViewModel extends ChangeNotifier {
  final SongRepository songRepo;
  final UserHistoryRepository historyRepo;
  final PlayerState playerState;

  List<Song> _songs = [];
  List<Song> _recentSongs = [];
  List<Song> _recommendedSongs = [];

  HomeViewModel(
      {required this.songRepo,
      required this.historyRepo,
      required this.playerState}) {
    init();
    playerState.addListener(_onPlayerStateChanged);
  }

  void init() {
    _songs = songRepo.fetchSongs();

    final recentIds = historyRepo.getRecentSongIds();

    _recentSongs = recentIds
        .map((id) => songRepo.fetchSongById(id))
        .whereType<Song>()
        .toList();

    _recommendedSongs =
        _songs.where((song) => !recentIds.contains(song.id)).take(3).toList();

    notifyListeners();
  }

  void _onPlayerStateChanged() {
    notifyListeners();
  }

  List<Song> get songs => _songs;

  List<Song> get recentSongs => _recentSongs;

  List<Song> get recommendedSongs => _recommendedSongs;

  Song? get currentSong => playerState.currentSong;

  void playSong(Song song) {
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
