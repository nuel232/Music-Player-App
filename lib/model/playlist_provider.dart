import 'package:flutter/material.dart';
import 'package:music_player/model/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //list of song
  final List<Song> _playlist = [
    //song 1
    Song(
      songName: 'With you',
      artistName: "Davido",
      albumArtistImagePath: 'assets/image/with-you.jpg',
      audioPath: 'assets/audio/d.mp3',
    ),
  ];

  //current song playing index
  int? _currentIndex;

  //G E T T E R S
  List<Song> get playlist => _playlist;
  int? get currentIndex => _currentIndex;
}
