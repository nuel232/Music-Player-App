import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/model/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //list of song
  final List<Song> _playlist = [
    //song 1
    Song(
      songName: 'With you',
      artistName: "Davido",
      albumArtistImagePath: 'assets/images/with-you.jpg',
      audioPath: 'assets/audio/d.mp3',
    ),
    Song(
      songName: 'Be There Still',
      artistName: "Olamide", // Fixed artist name
      albumArtistImagePath: 'assets/images/Olamide-Album.jpeg',
      audioPath:
          'assets/audio/Olamide-99-Ft-Seyi-Vibez-Asake-Young-Jonn-Daecolm-(JustNaija.com).mp3',
    ),
    Song(
      songName: 'Be There Still',
      artistName: "Davido",
      albumArtistImagePath: 'assets/images/with-you.jpg',
      audioPath: 'assets/audio/Be-There-Still.mp3',
    ),
  ];

  //current song playing index
  int? _currentSongIndex;

  //audioPlayer
  final AudioPlayer _audioPlayer = AudioPlayer();

  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlaylistProvider() {
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); //stop current song
    await _audioPlayer.play(AssetSource(path)); // play the new song
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  //seek to a specific position in the current song
  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to the next song if its not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if it's the last song, loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

  //play previous song
  void playPreviousSong() {
    //if more than 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    //listen for the total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for the current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // dispose audio player
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  /* 
  
  
  G E T T E R S


  */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  /*
  
  
  S E T T E R S


  */
  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;

    if (_currentSongIndex != null) {
      play(); // play the song at the new index
    }

    //update ui
    notifyListeners();
  }
}
