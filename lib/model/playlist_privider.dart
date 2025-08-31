import 'package:flutter/material.dart';
import 'package:music_player/model/song.dart';

class PlaylistPrivider extends ChangeNotifier {
  //list of song
  final List<String> _playlist = [
    //song 1
    Song(
      songName: 'With you',
      artistName: "Davido",
      albumArtistImagePath: 'assets/image/with-you.jpg',
      audioPath: 'assets/audio/d.mp3',
    ).songName,
  ];

  //current song playing index
  int? _currentIndex;

  //G E T T E R S
  List<String> get playlist => _playlist;
  int? get currentIndex => _currentIndex;
}
