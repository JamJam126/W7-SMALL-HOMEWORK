import 'package:flutter/widgets.dart';
import 'package:flutter_lab/TERM-2/W7-SMALL-HOMEWORK/data/repositories/users/user_history_repository.dart';

import '../../model/songs/song.dart';

class PlayerState extends ChangeNotifier {
  Song? _currentSong;
  final UserHistoryRepository historyRepo;

  PlayerState(this.historyRepo);

  Song? get currentSong => _currentSong;

  void start(Song song) {
    _currentSong = song;
    historyRepo.addSong(song.id);
    notifyListeners();
  }

  void stop() {
    _currentSong = null;

    notifyListeners();
  }
}
