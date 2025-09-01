import 'package:flutter/material.dart';
import 'package:music_player/model/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //list of song
  final List<Song> _playlist = [
    //song 1
    Song(
      songName: 'With you',
      artistName: "Davido",
      albumArtistImagePath: 'lib/assets/images/with-you.jpg',
      audioPath: 'lib/assets/audio/d.mp3',
    ),
  ];

  //current song playing index
  int? _currentSongIndex;

  //G E T T E R S
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //S E T T E R S
  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    notifyListeners();
  }
}
